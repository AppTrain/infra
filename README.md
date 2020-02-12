# Welcome to the Omnicom SMP

## github

make sure annalect email address is associated with
your github account. Add it in Settings, Emails.
Then verify the email address.

The ssh key you use to connect to github will be the same
key you use to connect to your dev instance.

## Set up ssh agent forwarding

edit `~/.ssh/config` file and add

    Host your.dns.name
        ForwardAgent yes
        StrictHostKeyChecking no
        UserKnownHostsFile /dev/null
        User myusername

The values `your.dns.name` and `myusername` should match the
values you define in the terraform file for your environment
in [dc_dev](https://github.com/accuenmedia/infra/tree/master/aws/accuen/dc_dev).

## Create dev environment

1. create terraform file in the [dc_dev](https://github.com/accuenmedia/infra/tree/master/aws/accuen/dc_dev) environment.

# Code Editors

configuration for various editors

## VSCode

- inside vscode plugins, install `Remote - SSH` by Microsoft

## Pycharm

TODO: need config here

# Getting started

ensure ssh config above is correct and instance is running

1. `ssh your.dns.name`
2. `cd annalect/smp`
    - temporary, need correct brancy
    - git checkout docker-compose-config
3. `direnv allow`
4. `./poetry.sh`
5. `docker-compose up`
6. see web app at `your.dns.name:9091`

## multiple people on same box

by default, only one user has access to these instances and
that is controlled by the github user name specified in the
environment file in [dc_dev](https://github.com/accuenmedia/infra/tree/master/aws/accuen/dc_dev).

So, if you wanted to get Jason to login into your box with you.
There is a command for that, you just need to know his github
user name.

    give-access jlmille4

to generalize

    give-access githubuser

You will also need appropriate ip rules in your security group.

## github user names

- Jason Miller: `jlmille4`
- Jeremiah Campbell: `meantheory`
- TODO: list all github user accounts here

# Docker Notes

Use `aws` cli to log into `ecr` (aws elastic container registry)

    eval $(aws ecr get-login --no-include-email)

Alternate version of above for OSX/Mac:

    eval $(aws ecr get-login --no-include-email | sed 's|https://||')

Pull down images

    docker-compose pull

Build dev image (always pull latest)

    docker-compose build --pull django

Bring up development environment

    docker-compose up -d

View logs of django webserver

    docker-compose logs -f django

Restart django webserver

    docker-compose restartd django

Shut it all down

    docker-compose down

## Common Troubleshooting

Docker login issues:
    ensure docker is using osxkeychain
    remove ~/.docker/config.json
    run eval $(aws ecr get-login --no-include-email)
    edit config.json to include https:// in auths

## TODO:
    1. git clone smp
    2. Update docker-compose to >= 1.25.0
    3. Add Some ENV Vars
    ```
    export AWS_ACCESS_KEY_ID=XXXX
    export AWS_SECRET_ACCESS_KEY=XXXX
    export AWS_DEFAULT_REGION=us-west-2
    export SMP_ENV=default
    export DOCKER_BUILDKIT=1 # or configure in daemon.json
    export COMPOSE_DOCKER_CLI_BUILD=1
    export SHOSTA_POSTGRES_PASSWORD=xxxxx
    ```

    had to create a docker-compose service for shosta
