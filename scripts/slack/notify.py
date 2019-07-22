import os
import slack

e = os.environ
assert e['BUILDKITE'] and e['CI']
assert e["BUILDKITE_PIPELINE_PROVIDER"] == "github"
token = os.environ["SLACK_API_TOKEN"]

class Build:

    @property 
    def branch(self):
        return e['BUILDKITE_BRANCH']
    
    @property 
    def creator(self):
        return e['BUILDKITE_BUILD_CREATOR']

    @property 
    def email(self):
        return e['BUILDKITE_BUILD_CREATOR_EMAIL']
    
    @property 
    def id(self):
        return e['BUILDKITE_BUILD_ID']
    
    @property 
    def number(self):
        return e['BUILDKITE_BUILD_NUMBER']
    
    @property 
    def url(self):
        return e['BUILDKITE_BUILD_URL']
    
    @property
    def organization(self):
        return e['BUILDKITE_ORGANIZATION_SLUG']
        
    @property
    def repo(self):
        return e['BUILDKITE_PIPELINE_SLUG']

    @property 
    def is_pull_request(self):
        ispr = e["BUILDKITE_PULL_REQUEST"]
        return True if ispr == "true" else False
    
    @property
    def pr_base_branch(self):
        return e["BUILDKITE_PULL_REQUEST_BASE_BRANCH"]
    
    @property
    def pr_repo(self):
        return e["BUILDKITE_PULL_REQUEST_REPO"]
    
    @property
    def git(self):
        return e['BUILDKITE_REPO']


client = slack.WebClient(token=token)
build = Build()

response = client.chat_postMessage(
    channel='#builds',
    #user='jeremiah',
    # text = f"Build for `{build.repo}` at {build.url}",

    blocks = [
        {
		    "type": "divider",
	    },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": f"*repo*: `{build.repo}` *branch*: `{build.branch}` *by*: `{build.creator}`",
            }
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": f"[{build.organization}/{build.number}]({build.url})",
            }
        },
        {
		    "type": "divider",
	    },
    ],
)

assert response["ok"]

