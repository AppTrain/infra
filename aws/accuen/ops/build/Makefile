terraform:
	terraform apply -auto-approve
	sleep 60

ansible:
	ansible-playbook buildenv-config.yml

# this is here because resources some time need an
# extra bit of time before connecting via ssh
then:
	sleep 60

all: terraform then ansible