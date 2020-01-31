import os
from collections import namedtuple
import requests
from loguru import logger
from github import Github

_buildkite_token = os.environ["BUILDKITE_TOKEN"]
_github_token = os.environ["GITHUB_TOKEN"]
_buildkite_api = "https://api.buildkite.com/v2"
_buildkite_headers = {"Authorization": "Bearer {token}".format(token=_buildkite_token)}

Repo = namedtuple("Repo", ("owner", "name", "url"))


def repositories(owners=["accuenmedia"]):
    g = Github(_github_token)

    valids = [
        "entrypoint",
        "smp",
        "infra",
        "apd",
        "docker-python",
        "docker-ops-tools",
        "packer-analyticsenv",
        "packer-buildenv",
        "packer-bastion",
        "smp-complications",
        "airflow",
        "art",
        "tfm",
        "dv360reporting",
        "dv360client",
        "dv360lib",
        "secret",
    ]

    for repo in g.get_user().get_repos():
        if repo.owner.login not in owners:
            # not the repository we are interested in
            continue

        if repo.name not in valids:
            # hacking, remove later
            continue

        owner = repo.owner.login
        name = repo.name
        url = repo.git_url.replace("://", "@").replace("/", ":", 1)

        r = Repo(owner.lower(), name.lower(), url)
        logger.info(r)

        yield r


def _buildkite_pipeline_template(org, repo):
    _template = """
{{
    "name": "{repo}",
    "slug": "{repo}",
    "repository": "git@github.com:{org}/{repo}.git",
    "steps": [
        {{
        "type": "script",
        "name": ":pipeline:",
        "command": "buildkite-agent pipeline upload"
        }}
    ],
    "provider_settings": {{
        "trigger_mode": "code",
        "build_pull_requests": true,
        "pull_request_branch_filter_enabled": false,
        "skip_pull_request_builds_for_existing_commits": true,
        "build_pull_request_forks": true,
        "prefix_pull_request_fork_branch_names": true,
        "build_tags": true,
        "publish_commit_status": true,
        "publish_commit_status_per_step": false,
        "repository": "{org}/{repo}",
        "pull_request_branch_filter_configuration": ""
    }}
}}
    """
    return _template.format(org=org, repo=repo)


def create_pipeline(org, repo):
    endpoint = f"{_buildkite_api}/organizations/{org}/pipelines"
    pipeline = _buildkite_pipeline_template(org, repo)
    r = requests.post(endpoint, data=pipeline, headers=_buildkite_headers).json()

    if "message" in r and r["message"] == "Forbidden":
        raise Exception(f"forbidden from creating {org}/{repo}")

    logger.info(f"pipeline created for {org}/{repo}")


def get_pipeline_webhook(org, repo, retry=True):
    logger.info(f"get_pipeline_webhook for {org}/{repo}")
    endpoint = f"{_buildkite_api}/organizations/{org}/pipelines/{repo}"
    r = requests.get(endpoint, headers=_buildkite_headers).json()
    not_found = r.get("message") == "Not Found"

    if not_found and retry:
        logger.error(f"{org}/{repo} not found, retrying")
        create_pipeline(org, repo)
        r = get_pipeline_webhook(org, repo, retry=False)
    elif not_found:
        msg = f"can not get or create {org}/{repo} pipeline"
        logger.error(msg)
        raise Exception(msg)

    return r


def wire_github_buildkite(org, repo, hook_url):
    g = Github(_github_token)
    repo = g.get_organization(org).get_repo(repo)
    needs_hook = True
    for hook in repo.get_hooks():
        if hook.config["url"] == hook_url:
            needs_hook = False

    if needs_hook:
        repo.create_hook("web", dict(url=hook_url))
        logger.info(f"{org}/{repo} hook created on github")
    else:
        pass
        # logger.info(f"{org}/{repo} github hook ALREADY EXISTS :-)")


def wire(repository):
    hook_response = get_pipeline_webhook(repository.owner, repository.name)

    hook_url = hook_response["provider"]["webhook_url"]
    wire_github_buildkite(repository.owner, repository.name, hook_url)


def wire_all():
    for repository in repositories():
        wire(repository)


if __name__ == "__main__":
    wire_all()
