// STYLE
#show: text.with(font: "Lora")
#set par(justify: true)// Justify the text
#show: page.with(header: "ITProMan", margin: 1.6cm,)

// BODY
#text(size: 2em, weight: "bold")[Le déploiement IT en vibe-coding]

#text(size: 1.2em)[Le meilleur moyen de supprimer la base de donnée en production ?]\
#text(size: 1.2em)[Ou le miracle qui va retirer la galère des équipes de développement ?]

#outline()

#pagebreak()

= RESUME
= INTRODUCTION
== CONTEXTE
La gestion de projets informatiques nécessite des méthodologies structurées pour organiser le développement et le déploiement de systèmes d'information. Le Systems Development Life Cycle (SDLC), située dans la phase "Execute and Control Project" du Project Life-Cyle (PLC), représente le cycle de vie produit le plus utilisé dans le domaine des technologies de l'information. Ce cycle établit une séquence logique d'activités de développement organisées en phases distinctes : la planification (planning), l'analyse (analysis), la conception (design), l'implémentation (implementation), et la maintenance et support (maintenance and support).

#figure(image("images/sdlc_2.png"), caption: [ TODO ])

Chaque phase du SDLC présente des enjeux spécifiques.

- La phase de planification se caractérise par sa forte dépendance aux livrables de la phase précédente du PLC et peut se décliner selon trois situations : une planification complète et imposée par le client (date, budget et fonctionnalités), une absence de planification préalable nécessitant une proposition complète du prestataire IT, ou une situation intermédiaire où seul le périmètre fonctionnel est défini. Cette phase distingue les projets feature-driven, typiquement internes avec flexibilité sur les délais, des projets date-driven, généralement externalisés avec flexibilité sur le périmètre fonctionnel.
- L'analyse englobe l'analyse du business, des utilisateurs, des technologies, des travaux antérieurs et de la faisabilité du projet. Cette phase produit la Software Requirements Specification (SRS), document décrivant le système logiciel à développer en détaillant les exigences fonctionnelles et non-fonctionnelles, pouvant inclure des cas d'utilisation, la définition des utilisateurs, des activités utilisateur et des contraintes métier.
- La conception élabore l'architecture des différentes parties du système selon une approche hiérarchique de décomposition en composants et modules. Cette phase définit la conception système, les interfaces, les bases de données et fichiers, ainsi que la conception des programmes, en sélectionnant la pile technologique (technology stack) appropriée. Le résultat est une description formelle et une représentation du système complet consignée dans un document de spécification détaillé.
- L'implémentation concrétise cette architecture par le développement, l'intégration, les tests, l'installation du système, ainsi que la formation et la documentation nécessaires à son utilisation.
- La phase de maintenance et support assure la pérennité du système en production, gérant les corrections d'erreurs, les améliorations fonctionnelles et l'adaptation aux évolutions de l'environnement organisationnel.

La maîtrise de ces phases et de leurs interdépendances constitue un facteur déterminant pour la gestion de projet IT, permettant d'assurer une progression ordonnée depuis l'identification d'un besoin jusqu'à la mise en production et le maintien opérationnel d'un système d'information.

== OBJECTIF DU RAPPORT
Le déploiement constitue une activité critique de la phase d'implémentation du SDLC, consistant à mettre le système en production et à le rendre disponible aux utilisateurs finaux. L'intégration de l'IA générative dans le processus de déploiement peut offrir plusieurs avantages.

- #strong[Automatisation de la création des fichiers de déploiement]: Beaucoup d'outils permettant de déployer des applications nécessitent la création de fichiers de configuration spécifiques (docker-compose.yml, Kubernetes YAML, etc.). L'IA générative peut automatiser la création de ces fichiers en fonction des spécifications du projet, réduisant ainsi le temps et les erreurs humaines.
- #strong[Optimisation des processus de déploiement]: L'IA peut analyser les processus de déploiement existants et suggérer des améliorations pour les rendre plus efficaces, en identifiant les goulots d'étranglement et en proposant des stratégies d'optimisation.
- #strong[Assistance à la résolution des problèmes]: Lors du déploiement, des problèmes techniques peuvent survenir. L'IA générative peut fournir une assistance en temps réel pour diagnostiquer et résoudre ces problèmes, en suggérant des solutions basées sur des bases de données de connaissances.
- #strong[Automatisation de la documentation]: La documentation est essentielle pour le déploiement et la maintenance des systèmes. L'IA générative peut automatiser la création de documentation technique, facilitant ainsi la compréhension et l'utilisation du système par les équipes de développement et d'exploitation.

== PROBLEMATIQUE
Le déploiement est une étape dans le SDLC qui peut être complexe et où plusieurs défis peuvent compromettre la mise en production.
- #strong[Complexité des environnements hétérogènes]: Les systèmes sont souvent déployés sur des infrastructures variées (cloud multi-fournisseurs, hybride) avec des configurations et contraintes différentes, augmentant le risque d'incompatibilités et d'erreurs. L'IA générative peut analyser automatiquement les caractéristiques de chaque environnement cible et générer des scripts ou fichiers de déploiement adaptés, incluant la détection et la résolution de conflits de dépendances.
- #strong[Gestion des fichiers de configuration]: La création et la gestion des fichiers de configuration peut être fastidieuses, chronophages et sujettes aux erreurs. L'IA générative peut automatiser la génération de ces fichiers en fonction des besoins spécifiques de chaque environnement, assurant ainsi une cohérence et une réduction des erreurs humaines.
- #strong[Gestion des dépendances et des versions]: Les systèmes modernes comportent de nombreuses dépendances (bibliothèques, frameworks, services externes) dont les incompatibilités de versions peuvent provoquer des échecs de déploiement difficiles à diagnostiquer. L'IA générative peut aider à identifier les dépendances nécessaires, à gérer les versions compatibles et à générer des scripts d'installation automatisés.
- #strong[Gestion des erreurs]: Le déploiement peut échouer pour diverses raisons, et la détection rapide des erreurs est cruciale. L'IA générative peut analyser les logs de déploiement en temps réel, identifier les erreurs potentielles et proposer des solutions correctives basées sur des modèles d'apprentissage automatique.
- #strong[Interruption de service]: Le déploiement nécessite souvent des interruptions de service impactant la disponibilité du système, particulièrement critique pour les systèmes en production 24/7. L'IA générative peut concevoir des stratégies de déploiement intelligentes (blue-green deployment, rolling updates) optimisant la séquence des opérations pour minimiser l'indisponibilité.

= METHODOLOGIE
== APPROCHE PEDAGOGIQUE
Dans le cadre de ce projet, l'approche pédagogique adoptée est celle de la classe inversée. Cette méthode consiste à inverser les rôles traditionnels des étudiants et des enseignants. En effet, les étudiants se voient attribuer un thème lié au SDLC ou au PLC qu'ils doivent étudier afin de le présenter à leurs pairs et aux enseignants lors de sessions dédiées. En particulier, pour ce projet, les étudiants sont chargés d'explorer l'intégration de l'IA générative dans le processus de déploiement des systèmes informatiques. Le but est de tester et évaluer comment l'IA générative permet d'améliorer l'efficacité, la qualité et la gestion des projets IT à chaque étape de leur cycle de vie. Le côté pratique est mis en avant à travers des démonstrations des résultats obtenus, des analyses critiques et des discussions sur les bénéfices et défis rencontrés.

== OUTILS ET TECHNOLOGIES UTILISES
<outils-et-technologies-utilises>
=== OpenDidac
<opendidac>
Notre but étant de s'intéresser à la phase de déploiement, nous avons tout d'abord sélectionné une application web à déployer. Nous avons choisi l'application web `OpenDidac`, qui est une plateforme open-source de gestion d'évaluation en ligne développée par l'HEIG-VD. En particulier, cette application permet aux enseignants de concevoir des questionnaires, aux étudiants de se connecter et de répondre aux évaluations, et enfin de récupérer les réponses aux questions pour analyse. Les questionnaires permettent plusieurs types de questions: vrai/faux, QCM, questions ouvertes, questions avec exécution de code ou encore des requêtes de bases de données. L'architecture de l'application est la suivante :
- #strong[Frontend]: Développé en Typescript avec le framework Next.js 14 pour React.
- #strong[Backend]: Développé en Typescript avec le framework Next.js API Routes.
- #strong[Base de données]: PostgreSQL avec modélisation gérée par l'ORM Prisma.
- #strong[Authentification]: Gestion des utilisateurs et des sessions avec NextAuth.js et keycloak.
- #strong[Conteneurisation]: Utilisation de Docker pour la création d'images et la gestion des conteneurs.

Le but de ce projet est donc de déployer cette application web en utilisant différentes technologies d'infrastructure, en s'appuyant sur l'IA générative pour automatiser le processus de déploiement.

=== Kubernetes
=== Terraform
=== Windsurf
Pour intégrer l'IA générative dans notre processus de déploiement, nous avons utilisé Windsurf. Windsurf est un environnement de développement intégré (IDE) de nouvelle génération intégrant nativement des capacités d'intelligence artificielle générative pour assister les développeurs tout au long du cycle de développement logiciel. En particulier, la fonctionnalité distinctive de Windsurf réside dans son mode Agent (appelé Code), qui permet à l'IA d'agir de manière autonome sur le code et le projet. En mode Agent, l'IA ne se limite pas à suggérer du code ou répondre à des questions, elle peut analyser l'architecture du projet, proposer des modifications dans les fichiers, créer des fichiers, refactoriser du code existant, générer des tests, créer de la documentation ou encore exécuter des commandes dans le terminal intégré à l'IDE.

#figure(image("images/windsurf_chat.png"), caption: [ Aperçu de l'interface de Windsurf avec les fichiers et le code à gauche, et la conversation et les configurations à droite])

Windsurf offre l'accès à plusieurs modèles d'IA avec des capacités et des coûts variables :

- #strong[Modèle de base (SWE-1)]: Un modèle gratuit et illimité adapté aux tâches courantes de développement, permettant une utilisation quotidienne sans consommation de crédits.
- #strong[Modèles premium]: Ces modèles avancés offrent des performances supérieures en termes de compréhension contextuelle, de génération de code complexe et de raisonnement. Chaque requête utilisant un modèle premium consomme 1 crédit.

Un plan gratuit incluant 25 crédits par mois est proposé, permettant aux développeurs de tester les modèles premium pour des tâches nécessitant des capacités avancées ou pour comparer les performances entre les différents modèles. Des plans payants sont également disponibles pour les utilisateurs ayant des besoins plus importants en crédits. Le tarif d'entrée pour 500 crédits par mois pour un utilisateur est de 15 USD.

#figure(image("images/windsurf_payment_plan.png"), caption: [ Plans de paiements de Windsurf, en décembre 2025 ])

Sans contraintes, l'IA peut produire du code non conforme aux standards de l'entreprise, introduire des vulnérabilités de sécurité ou utiliser des patterns incompatibles avec l'architecture existante. Face aux défis de qualité et de cohérence du code généré par l'IA, Windsurf propose deux mécanismes de contrôle : les rules et les workflows. Les rules garantissent que le code généré respecte les conventions établies, tandis que les workflows assurent la reproductibilité et la fiabilité des processus critiques comme les déploiements. Ces outils permettent ainsi de maintenir un contrôle qualité tout en bénéficiant de la productivité apportée par l'IA.

Les rules permettent de définir des directives que l'IA doit suivre lors de la génération de code. Ces règles peuvent être configurées à deux niveaux :
- #strong[Global Rules]: Applicables à tous les projets de l'utilisateur, elles définissent des préférences personnelles comme le style de code ou les conventions de nommage.
- #strong[Project Rules]: Spécifiques à un projet, elles permettent d'établir des guidelines organisationnelles, comme des standards d'architecture, des patterns de sécurité ou des contraintes techniques propres à l'entreprise. Idéalement, chaque entreprise utilisant windsurf devrait définir un ensemble de Project Rules pour garantir la cohérence et la qualité du code généré par l'IA au sein de ses projets.

Windsurf plusieurs modes d'application des rules, dont :
- #strong[Mode Always On]: Les rules sont systématiquement appliquées à chaque interaction avec l'IA, garantissant une conformité constante.
- #strong[Mode Model Decision]: L'IA décide de manière autonome quand appliquer les rules en fonction du contexte de la requête, offrant plus de flexibilité.

Les workflows, quant à eux, permettent d'automatiser des tâches répétitives en créant des séquences d'actions guidées. Par exemple, un workflow de déploiement peut enchaîner automatiquement la vérification des tests, la construction de l'application, la génération de documentation et le déploiement sur l'environnement cible. L'utilisateur invoque le workflow comme une commande, et Windsurf guide ensuite le processus étape par étape, en demandant les paramètres nécessaires et en exécutant les actions définies.

#box(image("images/windsurf_rules.png"))
#box(image("images/windsurf_workflow.png"))

=== Modèle GPT-5 (medium reasoning)
<modèle-gpt-5-medium-reasoning>
- #link("https://www.vellum.ai/best-llm-for-coding")
- #link("https://www.swebench.com/index.html")
- #link("https://epoch.ai/benchmarks/gpqa-diamond")

== PARTICIPANTS
== COLLECTE DE DONNEES
== CRITERES D'EVALUATION
= REFERENCES
= RESULTATS ET ANALYSES
== PHASE DE DEPLOIEMENT
== SYNTHESE DES RESULTATS
= DISCUSSION
== BENEFICES OBSERVES
== DEFIS RENCONTRES
== RETOUR D'EXPERIENCE DU GROUPE
== COMPARAISON AVEC D'AUTRES APPROCHES OU PRATIQUES
= CONCLUSION
= RECOMMANDATIONS
= REFERENCES
#show "Online": "En ligne"
#show "Available": "Lien"
#show link: l => underline(l)
#bibliography("biblio.bib", title: "Bibliographie", style: "ieee", full: true)
// TODO: rajouter liens des papers dans biblio.bib ! par samuel

== Liens additionnels
// ça se met pas dans une bibliographie les liens vers les outils
- Repository Git de Opendidac: #link("https://github.com/opendidac/opendidac")
- Windsurf website: #link("https://windsurf.com/")
- Windsurf pricing page: #link("https://windsurf.com/pricing")

= ANNEXES
