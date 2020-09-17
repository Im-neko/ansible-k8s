# Getting Start
Edit inventory/hosts file's IPs

Create non root user
`ansible-playbook playbook/init.yml -i inventory/hosts --ask-become-pass

Install dependencies
`ansible-playbook playbook/kube-dependencies.yml -i inventory/hosts --ask-become-pass

Master node setting
`ansible-playbook playbook/master-node.yml -i inventory/hosts --ask-become-pass`

If you want to schedule to all node, you would execute a command below.
`kubectl taint nodes --all node-role.kubernetes.io/master-`
