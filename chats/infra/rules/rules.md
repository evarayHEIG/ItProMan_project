# Terraform & Kubernetes — Conventions WinFSurf

## Structure du projet

* Respecter une architecture modulaire et lisible.
* `providers.tf` doit contenir exclusivement la configuration des providers.
* `variables.tf` doit regrouper toutes les variables d’entrée, documentées et typées.
* `outputs.tf` doit regrouper toutes les sorties exportées.
* `main.tf` doit contenir la logique principale du déploiement Kubernetes.
* `terraform.tfvars.json` doit être utilisé pour injecter les valeurs des variables.
* Aucun bloc `variable`, `output` ou `provider` ne doit apparaître dans d’autres fichiers.
* Tous les commentaires et le code doivent être faits en anglais.

## Style & formatage Terraform

* Tout nommage doit utiliser strictement du snake_case.
* Toute ressource ou data source doit être précédée d’un commentaire descriptif clair.
* Le code Terraform doit être formaté avec `terraform fmt` avant chaque commit.
* Pas de valeurs codées en dur dans les ressources lorsque des variables sont pertinentes.
* Les ressources Terraform doivent être regroupées de manière cohérente (par provider ou domaine fonctionnel).
* Le JSON doit être le moins long possible horizontallement.
* Decoupe modulaire du code dès que possible.

## Kubernetes (provider Terraform)

* Utiliser exclusivement les providers Terraform standards (`kubernetes`, `helm`) pour définir les objets Kubernetes.
* Préférer Helm via Terraform pour les composants complexes (Ingress, opérateurs, chart officiels).
* Suivre le schéma Kubernetes standard : namespace, RBAC, services, deployments.
* Toujours documenter les implications opérationnelles (sécurité, RBAC, réseau).

## Sécurité & pratiques d’entreprise

* Définir explicitement les versions des providers, jamais `~>` ou valeurs laxistes.
* Interdire toute dépendance implicite entre ressources sans `depends_on` si nécessaire.
* Ne jamais stocker de secrets dans terraform.tfvars.json ; utiliser un secret backend ou Vault.
* Appliquer systématiquement le principe du moindre privilège pour les rôles Kubernetes via Terraform.

## Gestion des environnements

* Un workspace Terraform par environnement (dev, staging, prod).
* Les variables sensibles doivent provenir d’un backend sécurisé.
* Les manifests Kubernetes spécifiques à un environnement doivent être paramétrés via variables.

## Qualité & maintenance

* Le projet doit être entièrement reproductible : un `terraform init && terraform apply` doit suffire.
* Les modules doivent être autonomes, documentés et éviter les circular dependencies.
* Chaque ressource doit être accompagnée d’un commentaire expliquant son objectif fonctionnel.
* Les outputs doivent exposer uniquement ce qui est pertinent pour d’autres modules ou opérateurs.
