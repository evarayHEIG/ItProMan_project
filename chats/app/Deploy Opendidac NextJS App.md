# Cascade Chat Conversation

  Note: _This is purely the output of the chat conversation and does not contain any raw data, codebase snippets, etc. used to generate the output._

### User Input

Tu es un expert en déploiement Kubernetes. J'aimerai que tu me déploies cette application Opendidac, sur la partie frontend/backend (NextJS). J'ai déjà une partie du déploiement réalisé pour la base de donnée de l'application et pour keycloack, déjà présent dans le dossier kube. J'aimerai que tu continues dans le dossier app pour générer tous les fichiers nécessaires à lancer l'application au complet. Défini moi un Pod pour l'app NextJS et un load balancer devant.

### Planner Response

Je vais explorer le dépôt pour identifier l’app Next.js (frontend/backend), vérifier s’il existe un Dockerfile et voir la structure du dossier `kube`. Ensuite, je créerai dans `kube/app` les manifests K8s demandés: un Pod pour l’app NextJS et un Service de type LoadBalancer devant. J’ajusterai les variables d’environnement (DB, Keycloak) si je les trouve dans le code.

J’exécute d’abord une recherche pour localiser l’app Next.js et inspecter `kube`.

*Searched filesystem*

*Searched filesystem*

*Listed directory [kube](file:///home/sam/mse/itproman/opendidac/kube) *

*Searched filesystem*

*Searched filesystem*

### Planner Response

Je vais inspecter le code Next.js et les manifests existants (db et keyclock) pour récupérer les variables/ports nécessaires et créer les manifests K8s dans kube/app: un Pod Next.js et un Service LoadBalancer. J'ouvre les fichiers clés en parallèle.

*Viewed [package.json](file:///home/sam/mse/itproman/opendidac/web/package.json) *

*Viewed [next.config.js](file:///home/sam/mse/itproman/opendidac/web/next.config.js) *

*Viewed [Dockerfile](file:///home/sam/mse/itproman/opendidac/web/Dockerfile) *

*Listed directory [db](file:///home/sam/mse/itproman/opendidac/kube/db) *

*Listed directory [keyclock](file:///home/sam/mse/itproman/opendidac/kube/keyclock) *

*Listed directory [app](file:///home/sam/mse/itproman/opendidac/kube/app) *

### Planner Response

Je vais rechercher dans le code Next.js quelles variables d’environnement sont nécessaires (DB, Keycloak, etc.) pour les injecter au Pod. Ensuite je créerai les manifests dans kube/app: Namespace, Pod, Service LoadBalancer, et un kustomization.yaml pour cohérence avec le reste du dossier kube.

*Grep searched codebase*

*Viewed [%5B...nextauth%5D.js](file:///home/sam/mse/itproman/opendidac/web/pages/api/auth/%5B...nextauth%5D.js) *

*Viewed [secret.yaml](file:///home/sam/mse/itproman/opendidac/kube/db/secret.yaml) *

*Viewed [service.yaml](file:///home/sam/mse/itproman/opendidac/kube/db/service.yaml) *

*Viewed [statefulset.yaml](file:///home/sam/mse/itproman/opendidac/kube/db/statefulset.yaml) *

*Viewed [deployment.yaml](file:///home/sam/mse/itproman/opendidac/kube/keyclock/deployment.yaml) *

*Viewed [service.yaml](file:///home/sam/mse/itproman/opendidac/kube/keyclock/service.yaml) *

*Viewed [kustomization.yaml](file:///home/sam/mse/itproman/opendidac/kube/db/kustomization.yaml) *

*Viewed [kustomization.yaml](file:///home/sam/mse/itproman/opendidac/kube/keyclock/kustomization.yaml) *

*Searched filesystem*

### Planner Response

Je vais localiser la configuration Prisma pour connaître la variable `DATABASE_URL` et vérifier d’autres variables d’environnement exigées (NEXTAUTH_URL, NEXTAUTH_SECRET, etc.). Ensuite, je créerai les manifests dans [kube/app](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app:0:0-0:0) (namespace, pod, service LoadBalancer, kustomization).

*Searched filesystem*

*Viewed [withPrisma.js](file:///home/sam/mse/itproman/opendidac/web/middleware/withPrisma.js) *

### Planner Response

Je vais ouvrir le schéma Prisma pour confirmer la variable `DATABASE_URL` et finaliser les variables d’environnement nécessaires au Pod. Ensuite je créerai les manifests K8s dans [kube/app](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app:0:0-0:0) (namespace, pod, service LoadBalancer, kustomization), en reprenant le style des dossiers [db](cci:7://file:///home/sam/mse/itproman/opendidac/kube/db:0:0-0:0) et [keyclock](cci:7://file:///home/sam/mse/itproman/opendidac/kube/keyclock:0:0-0:0).

*Viewed [schema.prisma](file:///home/sam/mse/itproman/opendidac/web/prisma/schema.prisma) *

*Viewed [ingress.yaml](file:///home/sam/mse/itproman/opendidac/kube/keyclock/ingress.yaml) *

### Planner Response

Je prépare les manifests Kubernetes pour l’app Next.js dans kube/app, en cohérence avec les autres dossiers (namespace, kustomization). J’ai besoin de créer:
- namespace.yaml (opendidac)
- secret.yaml (contiendra au moins DATABASE_URL et placeholders NextAuth)
- deployment.yaml (Pod Next.js)
- service.yaml (LoadBalancer en front)
- kustomization.yaml

Je vais créer ces fichiers maintenant dans kube/app. Dites-moi si vous préférez un nom d’image spécifique; à défaut, je mettrai un placeholder à remplacer lors du push d’image.

*Edited relevant file*

*Edited relevant file*

*Edited relevant file*

*Edited relevant file*

*Edited relevant file*

*Updated todo list*

### Planner Response

# Plan
- Créer les manifests K8s pour l’app Next.js dans [kube/app](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app:0:0-0:0) (namespace, secret, Pod, Service LoadBalancer, kustomization).
- Raccorder l’app à Postgres ([kube/db](cci:7://file:///home/sam/mse/itproman/opendidac/kube/db:0:0-0:0)) et préparer les variables NextAuth.
- Vous demander l’image container à utiliser et les secrets NextAuth pour finaliser.

# Ce que j’ai fait
J’ai ajouté les fichiers suivants dans [kube/app](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app:0:0-0:0):
- **namespace.yaml**: crée le namespace [opendidac](cci:7://file:///home/sam/mse/itproman/opendidac:0:0-0:0).
- **secret.yaml**: `opendidac-app-secret` avec:
  - `DATABASE_URL=postgresql://eval-dev:eval-dev@postgres:5432/eval-dev`
  - `NEXTAUTH_URL=http://opendidac.local`
  - `NEXTAUTH_SECRET`, `NEXTAUTH_SWITCH_CLIENT_ID`, `NEXTAUTH_SWITCH_CLIENT_SECRET`, `NEXTAUTH_SWITCH_ORGANIZATION_DOMAINS` (placeholders à remplacer)
- **pod.yaml**: Pod `opendidac-web` exposant le port 3000, variables via `opendidac-app-secret`.
- **service.yaml**: Service `LoadBalancer` `opendidac-web` exposant 80 -> 3000.
- **kustomization.yaml**: référence les ressources ci-dessus.

Références:
- DB: `postgres` (ClusterIP) dans [opendidac](cci:7://file:///home/sam/mse/itproman/opendidac:0:0-0:0), déjà défini par [kube/db](cci:7://file:///home/sam/mse/itproman/opendidac/kube/db:0:0-0:0).
- Keycloak: déjà présent ([kube/keyclock](cci:7://file:///home/sam/mse/itproman/opendidac/kube/keyclock:0:0-0:0), Ingress host `keycloak.local`). L’app, par défaut, utilise le provider SWITCH edu-ID (cf. `web/pages/api/auth/[...nextauth].js`). On peut basculer vers Keycloak si souhaité.

# À valider avec vous
- Image à déployer: j’ai mis un placeholder `opendidac/web:latest` dans le Pod.
  - Donnez-moi le registre/nom/tag (ex: `ghcr.io/<org>/opendidac-web:main`).
- Secrets NextAuth:
  - Voulez-vous utiliser SWITCH edu-ID (variables `NEXTAUTH_SWITCH_*`) ou Keycloak (il faudra activer le provider Keycloak côté code et fournir `NEXTAUTH_KEYCLOAK_*`) ?
  - Confirmez la valeur de `NEXTAUTH_URL` (doit correspondre au FQDN/URL exposé par le LB ou Ingress).

# Étapes de déploiement proposées
- Construire et pousser l’image de `web/`:
  - Construire à partir de [web/Dockerfile](cci:7://file:///home/sam/mse/itproman/opendidac/web/Dockerfile:0:0-0:0).
  - Pousser dans votre registre (selon le nom/tag choisi).
- Mettre à jour [kube/app/pod.yaml](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app/pod.yaml:0:0-0:0) avec votre image exacte.
- Appliquer les manifests:
  - `kubectl apply -k kube/app`
- Récupérer l’external IP/hostname du Service LoadBalancer:
  - `kubectl get svc -n opendidac opendidac-web`
- DNS/hosts:
  - Pointer `opendidac.local` vers l’IP/hostname du LB (ou ajuster `NEXTAUTH_URL`).
- Smoke tests:
  - HTTP GET sur `/` de l’app.
  - Auth: vérifier le provider choisi.
  - DB: s’assurer que les migrations Prisma sont appliquées. Si besoin, j’ajouterai un initContainer `npx prisma migrate deploy`.

# Options (sur demande)
- Convertir le Pod en **Deployment** et ajouter un **initContainer** pour `prisma migrate deploy`.
- Mettre un **Ingress** NGINX au lieu du LoadBalancer si votre cluster ne fournit pas de LB externe.

# Questions
1) Quel est le nom complet de l’image container (registre/nom/tag) à utiliser pour l’app Next.js ?
2) Souhaitez-vous utiliser SWITCH edu-ID (comme dans le code) ou Keycloak (pour être aligné avec votre stack) ?
3) Quelle URL finale pour `NEXTAUTH_URL` (ex: `https://opendidac.example.com`) ?

# Statut
- Manifests créés dans [kube/app](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app:0:0-0:0) et prêts à être appliqués.
- En attente de votre image et des secrets NextAuth pour finaliser et déployer.

*Viewed [Dockerfile](file:///home/sam/mse/itproman/opendidac/web/Dockerfile) *

### User Input

La proposition de "un initContainer npx prisma migrate deploy" est bonne, tu peux créer ce initContainer.  Donne moi les commandes précises pour tester le déploiement localement avec minikube. Minikube est déjà installé.

*Searched filesystem*

*Viewed [pod.yaml](file:///home/sam/mse/itproman/opendidac/kube/app/pod.yaml) *

### Planner Response

Je vais ajouter un initContainer dans le Pod pour exécuter `npx prisma migrate deploy` avec une boucle de retry tant que la base n’est pas prête, puis je vous donnerai un guide de commandes Minikube pour tester localement (build image, apply manifests, tunnel, tests). J’applique la modification du manifest maintenant.

*Edited relevant file*

*Updated todo list*

### Planner Response

Je viens d’ajouter l’initContainer qui exécute `npx prisma migrate deploy` avec retry avant de lancer l’app. Voici un guide de commandes Minikube pour tester localement.

# Pré-requis
- Image utilisée par les manifests: `opendidac/web:latest` (c’est ce que j’ai mis dans [pod.yaml](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app/pod.yaml:0:0-0:0))
- Minikube installé

# 1) Démarrer/Configurer Minikube
- **Activer l’ingress** (pour Keycloak qui a un Ingress):
```bash
minikube addons enable ingress
```
- (Optionnel) Démarrer le cluster si pas déjà fait:
```bash
minikube start
```

# 2) Builder l’image dans le Docker de Minikube
- Méthode recommandée (rapide et simple):
```bash
minikube image build -t opendidac/web:latest ./web
```
- Méthode alternative (utiliser le daemon Docker de Minikube):
```bash
eval "$(minikube docker-env)"
docker build -t opendidac/web:latest ./web
```

# 3) Déployer Postgres, Keycloak, puis l’app
- DB:
```bash
kubectl apply -k kube/db
kubectl -n opendidac get pods,svc
```
- Keycloak:
```bash
kubectl apply -k kube/keyclock
kubectl -n opendidac get deploy,svc,ingress
```
- App (avec initContainer Prisma):
```bash
kubectl apply -k kube/app
kubectl -n opendidac get pod opendidac-web -w
```

# 4) Vérifications (migrations et readiness)
- Voir l’état de l’initContainer (migrations):
```bash
kubectl -n opendidac describe pod opendidac-web | sed -n '/Init Containers/,$p' | sed -n '1,80p'
kubectl -n opendidac logs pod/opendidac-web -c prisma-migrate --tail=100
```
- Voir les logs de l’app:
```bash
kubectl -n opendidac logs pod/opendidac-web -c web -f
```

# 5) Exposer et tester l’app Next.js (Service LoadBalancer)
- Ouvrir un tunnel (nécessaire pour les Services LoadBalancer sous Minikube):
```bash
minikube tunnel
```
- Dans un autre terminal, récupérer l’IP externe:
```bash
kubectl -n opendidac get svc opendidac-web -w
```
- Ajouter un host local pour `NEXTAUTH_URL` (placeholder actuel: `http://opendidac.local`):
```bash
# Remplacez <EXTERNAL-IP> par l'IP du service opendidac-web
echo "<EXTERNAL-IP> opendidac.local" | sudo tee -a /etc/hosts
```
- Tester:
```bash
curl -i http://opendidac.local/
```

# 6) Accéder à Keycloak (Ingress)
- Récupérer l’IP du nœud Minikube:
```bash
MINIKUBE_IP=$(minikube ip); echo $MINIKUBE_IP
```
- Ajouter un host local pour l’Ingress Keycloak (`keycloak.local`):
```bash
echo "$MINIKUBE_IP keycloak.local" | sudo tee -a /etc/hosts
```
- Tester:
```bash
curl -I http://keycloak.local/
```
- Alternative sans /etc/hosts:
```bash
kubectl -n opendidac port-forward svc/keycloak 8080:8080
# Puis http://localhost:8080
```

# 7) Sanity checks
- Ressources:
```bash
kubectl -n opendidac get all
kubectl -n opendidac get events --sort-by=.lastTimestamp | tail -n 50
```
- Postgres OK:
```bash
PG_POD=$(kubectl -n opendidac get pod -l app=postgres -o jsonpath='{.items[0].metadata.name}')
kubectl -n opendidac exec -it "$PG_POD" -- psql -U eval-dev -d eval-dev -c '\dt'
```

# Notes importantes
- Les variables `NEXTAUTH_*` de [kube/app/secret.yaml](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app/secret.yaml:0:0-0:0) sont en placeholders. Pour de l’auth réelle via SWITCH edu-ID, fournissez des valeurs valides. Sans ça, l’app démarre et les migrations se font, mais l’auth échouera.
- Si vous souhaitez utiliser Keycloak comme provider NextAuth, il faudra activer le provider Keycloak dans le code et ajouter `NEXTAUTH_KEYCLOAK_*` dans le Secret.

# Nettoyage (optionnel)
```bash
kubectl delete -k kube/app
kubectl delete -k kube/keyclock
kubectl delete -k kube/db
```

# Statut
- InitContainer Prisma ajouté et prêt.
- Manifests prêts à être appliqués.
- Commandes Minikube fournies pour build/image, apply, tunnel et tests.

### User Input

J'ai une erreur avec minikube, je n'arrive pas à le démarrer.

> minikube start
😄  minikube v1.37.0 on Fedora 43 (vbox/amd64)
✨  Using the docker driver based on existing profile
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.48 ...
🏃  Updating the running docker "minikube" container ...

❌  Exiting due to RUNTIME_ENABLE: Failed to enable container runtime: docker not running

pourtant docker a l'air de bien tourner...
systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: disabled)
    Drop-In: /usr/lib/systemd/system/service.d
             └─10-timeout-abort.conf
     Active: active (running) since Tue 2025-12-02 00:33:10 CET; 1h 2min ago

et encore
> docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

### Planner Response

Merci pour le détail. Le message “Failed to enable container runtime: docker not running” vient quasi toujours d’un ancien profil Minikube configuré avec le runtime Docker à l’intérieur du nœud. Les images récentes utilisent containerd par défaut; d’où l’erreur. Le plus simple: recréer le cluster en forçant containerd.

# Correctif rapide (recommandé)
- Inspecter le profil actuel:
```bash
minikube profile list
minikube config view
```
- Supprimer le cluster existant “minikube”:
```bash
minikube delete
```
- Redémarrer en forçant containerd:
```bash
minikube start --driver=docker --container-runtime=containerd
```
- Vérifier:
```bash
minikube status
```

# Variante (si vous voulez le paramètre par défaut à l’avenir)
- Fixer le runtime par défaut, puis (re)créer:
```bash
minikube config set container-runtime containerd
minikube delete
minikube start --driver=docker
```

# Diagnostic si ça échoue encore
- Logs ciblés:
```bash
minikube logs --problems
minikube logs | tail -n +1 | sed -n '1,200p'
```
- Démarrage verbeux:
```bash
minikube start --driver=docker --container-runtime=containerd -v=2 --alsologtostderr
```

# Reprise du déploiement (une fois Minikube OK)
- Construire l’image localement pour Minikube:
```bash
minikube image build -t opendidac/web:latest ./web
```
- Appliquer les manifests:
```bash
kubectl apply -k kube/db
kubectl apply -k kube/keyclock
kubectl apply -k kube/app
```
- Exposer le Service LoadBalancer:
```bash
minikube tunnel
kubectl -n opendidac get svc opendidac-web
```
- Ajouter l’entrée hosts pour `opendidac.local` pointant vers l’external IP retournée.

# Remarque
Si vous tenez absolument au runtime Docker dans le nœud (non recommandé), il faut un ancien kicbase et du “docker-in-docker”, souvent cassé sur Fedora/SELinux. Forcer containerd évite ces soucis et c’est le chemin supporté.

Dites-moi si `minikube start --container-runtime=containerd` résout l’erreur; je vous guiderai pour la suite des tests.

*Viewed [out](file:///mnt/vm/ItProMan_project/keyclock/out) *

### User Input

Le conteneur de keycloak a l'air d'avoir crashé, voici  ses logs puis la liste des événements. Peut-on coriger ceci ? 


Changes detected in configuration. Updating the server image.
Updating the configuration and installing your custom providers, if any. Please wait.
2025-12-02 11:51:25,549 WARN  [org.key.qua.run.cli.Picocli] (main) The following used options or option values are DEPRECATED and will be removed in a future release:
	- proxy: Use proxy-headers.
Consult the Release Notes for details.
/opt/keycloak/bin/kc.sh: line 161:    84 Killed                  'java' -Dkc.config.build-and-exit=true '-XX:MetaspaceSize=96M' '-XX:MaxMetaspaceSize=256m' '-Dfile.encoding=UTF-8' '-Dsun.stdout.encoding=UTF-8' '-Dsun.err.encoding=UTF-8' '-Dstdout.encoding=UTF-8' '-Dstderr.encoding=UTF-8' '-XX:+ExitOnOutOfMemoryError' '-Djava.security.egd=file:/dev/urandom' '-XX:+UseParallelGC' '-XX:GCTimeRatio=4' '-XX:AdaptiveSizePolicyWeight=90' '-XX:FlightRecorderOptions=stackdepth=512' '-XX:MinHeapFreeRatio=10' '-XX:MaxHeapFreeRatio=20' '-XX:MaxRAMPercentage=70' '-XX:MinRAMPercentage=70' '-XX:InitialRAMPercentage=50' '--add-opens=java.base/java.util=ALL-UNNAMED' '--add-opens=java.base/java.util.concurrent=ALL-UNNAMED' '--add-opens=java.base/java.security=ALL-UNNAMED' -Dkc.home.dir='/opt/keycloak/bin/..' -Djboss.server.config.dir='/opt/keycloak/bin/../conf' -Djava.util.logging.manager=org.jboss.logmanager.LogManager -Dpicocli.disable.closures=true -Dquarkus-log-max-startup-records=10000 -cp '/opt/keycloak/bin/../lib/quarkus-run.jar' io.quarkus.bootstrap.runner.QuarkusEntryPoint 'start'



LAST SEEN   TYPE      REASON      OBJECT                          MESSAGE
39m         Normal    Created     pod/keycloak-794f6dcb84-fzgsl   Created container: keycloak
38m         Warning   Unhealthy   pod/keycloak-794f6dcb84-fzgsl   Readiness probe failed: Get "http://10.244.0.9:8080/health/ready": dial tcp 10.244.0.9:8080: connect: connection refused
5m12s       Normal    Pulled      pod/keycloak-794f6dcb84-fzgsl   Container image "quay.io/keycloak/keycloak:24.0.5" already present on machine
4m12s       Warning   BackOff     pod/keycloak-794f6dcb84-fzgsl   Back-off restarting failed container keycloak in pod keycloak-794f6dcb84-fzgsl_opendidac(d308f90a-539b-4f57-a2cd-e682e4261b45)


Ensuite comment est-c que je configure l'application NextJS pour utiliser ce conteneur keycloak en local ? l'usage de switchid ne fonctionne pas évidement. Comment je peux créer un premier compte dans keycloak pour tenter de me connecter ensuite à opendidac ?

*Updated todo list*

*Proposed code*

*Proposed code*

*Viewed [secret-admin.yaml](file:///home/sam/mse/itproman/opendidac/kube/keyclock/secret-admin.yaml) *

*Proposed code*

### Planner Response

Je vois un OOM kill (“Killed ‘java’ …”) au démarrage de Keycloak. Sur Minikube, 1 GiB de mémoire pour Keycloak n’est souvent pas suffisant, ce qui explique le crash et la sonde de readiness en échec.

# Cause du bug
- **OOM**: Keycloak a été tué par l’OOM-killer pendant la phase de build/config.
- **Minikube**: mémoire par défaut trop faible pour Keycloak + Postgres + app.

# Correctifs à appliquer
- **Augmenter la mémoire du Pod Keycloak** (proposition de patch fournie).
- **Augmenter la mémoire de Minikube** (ex. 6–8 Go).
- Optionnel: remplacer `KC_PROXY=edge` par `proxy-headers` pour suivre la dépréciation (non bloquant pour le démarrage).

J’ai proposé un patch pour augmenter les ressources dans [kube/keyclock/deployment.yaml](cci:7://file:///home/sam/mse/itproman/opendidac/kube/keyclock/deployment.yaml:0:0-0:0):
- requests: cpu 300m, mem 1Gi
- limits: cpu 1, mem 2Gi

Appliquez-le, puis redéployez Keycloak:
- kubectl apply -k kube/keyclock
- kubectl -n opendidac rollout restart deploy/keycloak
- kubectl -n opendidac get pods -w
- kubectl -n opendidac logs deploy/keycloak --tail=200 -f

Et augmentez la mémoire Minikube si besoin:
- minikube stop
- minikube start --driver=docker --container-runtime=containerd --memory=8192 --cpus=4
- minikube addons enable ingress

# Configurer Next.js pour utiliser Keycloak
J’ai proposé d’activer le provider Keycloak dans `web/pages/api/auth/[...nextauth].js` (import provider + `providers: [keycloakProvider]`) et d’ajouter les variables dans [kube/app/secret.yaml](cci:7://file:///home/sam/mse/itproman/opendidac/kube/app/secret.yaml:0:0-0:0):
- `NEXTAUTH_KEYCLOAK_CLIENT_ID`
- `NEXTAUTH_KEYCLOAK_CLIENT_SECRET`
- `NEXTAUTH_KEYCLOAK_ISSUER_BASE_URL=http://keycloak.local/realms/opendidac`
- Garder `NEXTAUTH_URL=http://opendidac.local`

Après mise à jour:
- kubectl apply -k kube/app
- minikube tunnel  # pour exposer le Service LoadBalancer de l’app
- Ajouter dans /etc/hosts:
  - “<EXTERNAL-IP-du-service> opendidac.local”
  - “<IP-de-minikube> keycloak.local” (Ingress Keycloak)

# Initialiser Keycloak (realm, client, utilisateur)
1) Accédez à l’admin Keycloak:
- http://keycloak.local
- Login admin: valeurs de `keycloak-admin-secret` (admin / change-me par défaut)

2) Créez le realm:
- Realms → Create realm → Name: [opendidac](cci:7://file:///home/sam/mse/itproman/opendidac:0:0-0:0)

3) Créez le client OIDC (confidential):
- Clients → Create client
  - Client ID: `opendidac-web`
  - Client type: OpenID Connect
  - Turn ON “Client authentication” (confidential)
  - Standard flow: ON
- Save, puis configurez:
  - Valid redirect URIs: `http://opendidac.local/api/auth/callback/keycloak`
  - Web origins: `http://opendidac.local`
  - Récupérez le Client Secret généré.

4) Créez un utilisateur:
- Users → Add user
  - Renseignez email/username
  - Email verified: ON (facilite les tests)
- Credentials → Set password
  - Décocher “Temporary” pour fixer le mot de passe.

5) Mettez à jour le Secret de l’app:
- kube/app/secret.yaml:
  - `NEXTAUTH_KEYCLOAK_CLIENT_ID=opendidac-web`
  - `NEXTAUTH_KEYCLOAK_CLIENT_SECRET=<copié de Keycloak>`
- kubectl apply -k kube/app
- kubectl -n opendidac rollout restart pod/opendidac-web (ou supprimez le pod pour recharger les env)

# Tests
- Keycloak: curl -I http://keycloak.local/health/ready doit renvoyer 200 après quelques secondes.
- App: curl -I http://opendidac.local/
- Auth: depuis votre navigateur, allez sur http://opendidac.local, lancez la connexion, validez que la redirection passe par Keycloak et que l’utilisateur peut se connecter.

# Remarques
- Si Keycloak redémarre encore, vérifiez:
  - Minikube memory/cpu: `minikube status`
  - Events: `kubectl -n opendidac get events --sort-by=.lastTimestamp | tail -n 50`
  - Logs détaillés: `kubectl -n opendidac logs deploy/keycloak --tail=500`

# Statut
- Correctif proposé: augmentation mémoire Keycloak + instructions Minikube.
- Propositions pour activer le provider Keycloak côté NextAuth et pour les secrets env de l’app.
- Étapes détaillées pour créer realm/client/utilisateur et tester la connexion.