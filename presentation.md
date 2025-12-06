INTRODUCTION -> se présenter rapidement
    CONTEXTE 
    Remettre le schéma de toutes les phases
    OBJECTIF DU RAPPORT & PROBLEMATIQUE 
    à voir
METHODOLOGIE	
    OUTILS ET TECHNOLOGIES UTILISES:
    - windsurf -> rules, workflow, ide, prix ...
    - gpt 5 -> montrer 1-2 benchmarks
    - kubernetes -> plateforme pour déployer app
    - terraform -> déploiement cloud facilité
    - opendidac -> présentation rapide de ce que c'est
    COLLECTE DE DONNEES: 
    - article qui parle du déploiement cloud avec IA -> à chercher
    CRITERES D’EVALUATION:
    - est-ce que ça marche?
    - bonnes pratiques?
    - efficacité: est-ce que c'est plus rapide avec l'IA qu'à la main?
    - sécurité?
    - prix 
RESULTATS ET ANALYSES (SELON LE GROUPE)	
    PHASE DE DEPLOIEMENT :
    - kubernetes: déployer app, faire un schéma de comment les trucs sont connectés ->
        - en général: bonnes pratiques respectées (kusto, namespace, sectret), commandes fonctionnent, montrer n'importe quel prompt
        - db -> PersistentVolume correctement créé, choix de variables d'environnement par défault, checks de santé  
        - keycloak(idp) -> configuration (tuto pour créer realm, user, ...), variables d'env, correction d'erreur
        - web -> fonctionnel, dépannage environnement local (minicube)
    - terraform: déployer infra -> instance/machine déployées, sg bien configurés, montrer tous les prompts et la descente en enfer, à la fin ça fonctionnne, bonnes pratiques pas toujours respectées, quand ça devient plus technique l'IA ne s'en sort pas et il faut devenir très précis dans les prompts. 
    SYNTHESE DES RESULTATS :
    Comparaison entre les méthodes traditionnelles et l'approche IA générative: 
    - kubernetes: pas besoin de comprendre pour avoir quelque chose qui marche (pas forcément positif). Est-ce que c'est pas aussi le fait que kubernetes soit bien fait qui donne ce résultat?
    - En ne connaissant pas kubernetes, on n'aurait probablement pas fait autant de fichiers différents qui suivent les bonnes pratiques.
    - terraform: on aurait plus séparés en petits fichiers, pour les instance on aurait fait moins de répétition de code comme juste des noms changent -> abstraction pour passer les param, ça marche mais c'est moche
DISCUSSION	
    BENEFICES OBSERVES :
    - En général, tu gagnes du temps au début (même si ça fonctionne pas, prompt + corrections à la main prend moins de temps que from scratch).
    - Expériementation rapide sans avoir besoin de connaître les outils en profondeur. 
    - kubernetes -> gain de temps sur le boilerplate code, gain de qualité en bonnes pratiques parce qu'on connaissait pas bien, on peut avoir quelque chose qui fonctionne sans connaître kubernetes en profondeur.
    - terraform: gain de temps au début, c'est tout, pas de gain de qualité
    - permet de découvrir de nouvelles approches auxquelles on n'aurait pas pensé
    DEFIS RENCONTRES :	
    - terraform: il y a bcp de manières de faire -> l'IA choisit une manière de faire et c'est pas forcément la meilleure, il faut une bonne connaissance de l'outil (clé ssh, crendentials déjà présents), qualité du code moyenne/mauvaise, beaucoup de guidage dans les prompts, perte de temps sur le processus entier
    - rules: les rules ne sont pas toujours suivies, n'ont pas l'air fiables
    - kubernetes: difficile de mettre les 3 parties ensemble -> obligé de comprendre le code pour comprendre l'erreur pour choisir la bonne direction proposée par l'IA, on dirait que l'IA n'a pas lu le readme
    - les réponses sont très verbeuses et on peut facilement passer à côté d'une info importante. Si on avait qqn qui nous guidait, il nous balancerait pas 15 infos à la tête et attendrait nos choix avant de continuer. Des fois, on ne sait pas trop où ça va. 
    - Si on est limité dans le crédits, on a tendance à minimiser les prompts et donc à ne pas toujours répondre aux questions de l'IA sur les choix à faire.
    - On sait pas vraiment ce que c'est de faire un bon prompt et ce n'est pas trivial de le savoir.
    - Le temps de réponse peut être long (et ennuyant).
    - On ne peut pas faire confiance à 100% aux réponses de l'IA -> il faut qqn qui connait pour relire, ça prend du temps.
    - Parfois il semble que le modèle n'a pas toutes les infos récentes (trucs dépréciés ou anciennes bonnes pratiques)
    RETOUR D’EXPERIENCE DU GROUPE :
    - Les enjeux du déploiement sont moins importants dans la maintenance long terme (vs implémentation) donc c'est moins grave si le code est pas parfait et qu'on doit repasser dessus par la suite. Dans le contexte d'une app petite.
    - ça a l'air pas mal d'utiliser l'IA pour démarrer le code du déploiement mais pas pour le faire à 100%, corrections des erreurs plutôt à la main.
    COMPARAISON AVEC D'AUTRES APPROCHES OU PRATIQUES :
    A la main sans IA -> par prompt en ligne -> dans un ide dédié avec contexte lcoal -> tout ia agent avec plusieurs en parallèle qui travaillent / seveurs MCP
CONCLUSION
- Résumé des points clé -> ça marche prafois mais plutôt bien jusqu'à un certain point c.f. ci dessus
- Ah on a bien essayé et ça nous donne des clés pour le futur
- Perspectives: 
    - tester une intégration plus poussée: serveurs MCP
    - creuser l'utilisation des rules -> plus précis, exigeants, moins de liberté?
    - étudier le prompt engineering pour proposer de meilleurs prompts de départs qui donneraient une résultat plus précis et en moins d'étapes.
    - peut permettre d'avoir rapidement une archi exécutable (RUP)
    - peut permettre d'avoir une app plus rapidement adapté à la production car on a pu la mettre en staging plus rapidement. Si on déploie ne staging régulièrement, le client peut plus facilement les tester et on peut donc adapter l'app aux besoins clients plus rapidement 
- RECOMMANDATIONS	
    - industrie: Peut accélérer le processus mais on ne peut pas mettre en prod du code IA sans relecture par qqn qui connait. Faites des fichiers des rules pour homogénéiser ou trouver une autre solution mais il faut un standard.
    - éducation: Pourquoi pas l'utiliser pour générer du code qui fonctionne mais il faut faire l'effort de comprendre ce qui a été écrit. On peut avoir du code qui fonctionne en n'ayant rien compris. En général, on recommande de découvrir un outil par soi même, sans IA. Intéressant quand tu es bloqué -> démarche de comprendre. Intéressant pour comprendre un point précis/ régler un problème mais pas pour générer un code complet.

