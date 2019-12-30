docker run -it \
    -v ${HOME}/.ssh:/root/.ssh:ro \
    -v $(pwd)/identidock.yml:/ansible/identidock.yml \
    -v $(pwd)/hosts:/etc/ansible/hosts \
    --rm=true generik/ansible ansible-playbook --ask-sudo-pass identidock.yml
