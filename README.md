# TP-5 → TP-7 — Ansible : Apache Docker + Vault + SSH

## Machines lab (exemple)

| Rôle | IP |
|------|-----|
| Ansible (chef) | 10.0.100.4 |
| Client | 10.0.100.5 |
| User | admin / admin |

> Mets à jour `prod.yml` si les IP changent.

## Contenu

- **TP-5** : Docker + conteneur `httpd` port 80
- **TP-6** : template `bienvenue sur {{ ansible_hostname }}`, boucle yum, volume
- **TP-7** : `ansible-vault` + clé SSH + `vars_files`

## Lancer

```bash
cd webapp
ansible-playbook -i prod.yml deploy.yml --ask-vault-pass
curl http://IP_CLIENT
```

## Vault

Le fichier `files/secrets/credentials.vault` doit être **chiffré** :

```bash
ansible-vault encrypt files/secrets/credentials.vault
```

Exemple non chiffré : `files/secrets/credentials.vault.example`
