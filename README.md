# TP-5 — Déployer un conteneur Apache avec Ansible

## Objectif

Depuis une machine Ansible, déployer Apache (`httpd`) dans un conteneur Docker sur un client, port 80.

## Machines (lab EazyTraining)

| Rôle    | IP         | User / mdp   |
|---------|------------|--------------|
| Ansible | 10.0.91.5  | admin/admin  |
| Client  | 10.0.91.6  | admin/admin  |

> Si les IP changent sur le lab, mets à jour `prod.yml`.

## Fichiers

```text
webapp/
├── prod.yml              # inventaire (groupe prod)
├── group_vars/prod       # login / sudo
├── install_docker.sh     # install Docker CentOS 7
├── deploy.yml            # playbook
└── README.md
```

## Sur la machine Ansible

```bash
# 1) Récupérer le projet (après push GitHub)
git clone <URL_DE_TON_REPO> webapp
cd webapp

# 2) Test connexion
ansible -i prod.yml prod -m ping

# 3) Déploiement
ansible-playbook -i prod.yml deploy.yml

# 4) Vérification
curl http://10.0.91.6

# 5) Lint
sudo yum install -y python3-pip || true
pip3 install ansible-lint --user
ansible-lint deploy.yml

# 6) Debug utile
ansible-playbook -i prod.yml deploy.yml -vv
ansible -i prod.yml prod -m setup -a 'filter=ansible_distribution*'
```
