# Cahier des charges

## Contexte et problématique
La musique a une part importante dans toute manifestation (anniversaire, concert, bar, soirée entre amis, etc.). Néanmoins, la musique est souvent gérée par une personne sur un appareil et il devient difficile pour une autre personne de changer/proposer sa musique.

## Objectif
Nous souhaitons proposer une application de type client-serveur qui permet aux différents utilisateurs de proposer leur propre musique au serveur, qui les jouera sur un système audio au fur et à mesure de l'événement.

## Périmètre
Il s'agit ici de développer une application client-serveur avec interface graphique qui fonctionnera au niveau du réseau local. Il ne s'agit pas de réaliser une application client-serveur qui permettra de proposer de la musique à n'importe quel serveur n'importe où dans le monde. De plus, le serveur ne pourra pas gérer un nombre illimité d'utilisateurs et pourra lire un nombre limité de formats.

## Fonctionnalités importantes
Les fonctionnalités listées ci-dessous (dans l'ordre d'importance) sont nécessaires au bon fonctionnement de l'application.

### Côté serveur
- Fonction: Interface utilisateur
  - Objectif: Interface simplifée pour utiliser le logiciel
  - Description: Selon le mockup en annexe
  - Contraintes: La fenêtre de peut pas se redimensionner


- Fonction: Lecture des fichiers MP3 et AAC
  - Objectif: Le serveur supporte uniquement les fichiers MP3 et AAC
  - Description: -
  - Contraintes: Seuls codecs supportés au début


- Fonction: Contrôle du volume de la musique
  - Objectif: Proposer directement dans l'application le réglage du volume
  - Description: -
  - Contraintes: -


- Fonction: Actions de base sur la musique
  - Objectif: Effectuer des actions sur la lecture de la musique
  - Description: Passer à la musique suivante, mettre sur pause, arrêter la musique
  - Contraintes: -


- Fonction: Paramétrages basiques du serveur
  - Objectif: Donner un nom au serveur
  - Description: Donner la possibilité aux clients de savoir sur quel serveur ils vont se connecter
  - Contraintes: -


- Fonction: Effectuer une annonce de connexion
  - Objectif: Autoriser les clients à se connecter au serveur
  - Description: Effectue une annonce dans le réseau local pour s'annoncer aux clients que le serveur est disponible à recevoir de la musique
  - Contraintes: Se limite au réseau local


- Fonction: Réception de la musique
  - Objectif: Ajouter de la musique sur le serveur
  - Description: Le client transfère de la musique au serveur qui sera ensuite lue
  - Contraintes:
    - Un client ne peut envoyer qu'une fois la musique sur le serveur
    - \+ voir point ci-dessous


- Fonction: Ajout de la musique à la base de données
  - Objectif: Sauvegarder et rechercher de la musique par la suite
  - Description: Les méta-data (si présents) ainsi que les données suivantes sont enregistrées dans la base de données:
    - Artiste
    - Titre de la chanson
    - Album
    - Durée de la piste
    - Nom de fichier
    - Utilisateur qui a uploadé la musique
    - Date d'ajout de la piste
    - Date de lecture de la piste
  - Contraintes: -


- Fonction: Accepter ou refuser l'ajout de nouvelles musiques
  - Objectif: Accepter ou refuser de nouveaux clients à mettre de la musique sur le serveur
  - Description: Si le client tente de mettre de la musique alors que les options suivantes sont activées, l'action du client est refusé:
    - Nombre limité de transfert en parallèle
    - Limitation du nombre de musique que le serveur autorise à avoir dans la queue de lecture
    - Limitation selon l'espace disque
  - Contraintes: Le client reçoit un message que les limitations sont atteintes


- Fonction: Système de favoris/playlist
  - Objectif: Permettre aux utilisateurs de sauvegarder les musiques qui leur plaisent
  - Description: Si un client souhaite enregistrer une musique, le serveur lui envoie les informations de cette musique et l'utilisateur peut l'enregistrer dans ses favoris ou dans une playlist. Possibilité de sauvegarder les éléments suivants:
    - toute la musique qui a été jouée durant l'événement
    - toute la musique qui a été jouée depuis que le client s'est connecté pour la première fois de l'événement
    - des musiques indépendantes
  - Contraintes: Un client ne peut pas enregistrer deux fois la même musique durant le même événement


- Fonction: Système de vote
  - Objectif: Permettre aux utilisateurs de changer de musique ou d'en prioriser une
  - Description: Si un certain poucentage d'utilisateur souhaite changer de musique, la musique passe à la suivante. De plus, une musique qui a un vote positif remonte dans la queue de lecture et inversement, descend
  - Contraintes: Un client ne peut que voter qu'une fois pour changer de musique et qu'une fois par musique dans la queue de lecture


- Fonction: Nettoyage de la base de données
    - Objectif: Faire de la place sur le serveur
    - Description: Permet de supprimer la musique qui correspond aux critères suivants (à choix):
      - n'existe plus sur le disque
      - n'a pas été lue durant l'événement
      - n'a pas été lue depuis une certaine date
    - Contraintes: Nettoyage automatique si la capacité de stockage est limitée


### Côté client
- Fonction:
  - Objectif:
  - Description:
  - Contraintes:

## Fonctionnalités optionnelles
Les fonctionnalitées listées ci-dessous ne sont pas nécessaires au bon fonctionnement de l'application mais pourront être réalisées si le temps le permet.

### Côté serveur
- Fonction: Filtres de recherche
  - Objectif: Rechercher de la musique sur le serveur (queue de lecture et playlist)
  - Description: Rechercher et mettre en favoris/voter pour une musique en particulier
  - Contraintes: Recherche limitée selon la base de données


- Fonction: Configuration avancée du serveur
  - Objectif: Options poussées pour la configuration du serveur
  - Description:
    - Lecture séquentielle: les musiques sont lues les unes après les autres (en ne tenant pas compte des votes - premier arrivé, premier servi)
    - Lecture démocratique: les musiques sont lues en fonction des préférences des utilisateurs (grâce au système de vote)
    - Lecture aléatoire: les musiques sont lues aléatoirement, quelque que soit les votes
    - Lecture hybride: alternation entre les musiques populaires (beaucoup de votes) et moins populaires (moins ou pas de votes)
    - Chemin de stockage de la musique: où est enregistrée la musique
  - Contraintes: Refuser les actions effectuées par les clients si elles ne respectent pas la configuration du serveur


### Côté client
- Fonction:
  - Objectif:
  - Description:
  - Contraintes:

## Résumé du fonctionnement du programme
1. Un serveur est lancé et est configuré selon les préférences de l'administrateur
3. Le serveur est démarré et les clients peuvent s'y connecter
4. Le client est lancé et voit la liste des serveurs actifs et disponibles
5. Le client se connecte sur un serveur
6. Le client peut se connecter sur le serveur
7. Une fois connecté, il peut effectuer les fonctionnalités paramétrées sur le serveur:
  - Proposer de la nouvelle musique
  - Voter pour changer/organiser la musique
  - Enregistrer en favoris des musiques ou la liste de lecture
8. Le serveur enregistre la musique en local et la lit au fur et à mesure de l'événement, en fonction des éventuelles préférences des utilisateurs
9. Une fois l'événement terminé, la musique est conservée sur le serveur jusqu'à ce que l'administrateur décidé de nettoyer la base de données ou que la capacité maximum de stockage est atteinte
10. Le client conserve une copie locale des pistes qui ont été jouées durant sa présence et peut, de ce fait, retrouver les morcaux qui lui ont plus lors de cet événement

## Spécifications techniques
L'application sera réalisée à l'aide des technologies suivantes:
- Java (java.com): pour la réalisation du programme
- JavaFX (docs.oracle.com/javafx): pour la réalisation de l'interface graphique
- SQLite (sqlite.org): pour la réalisation de la base de données
- JSON (json.org): pour l'interaction entre le client et le serveur
- \+ différentes librairies qui pourraient être découvertes durant la conception du programme

Et s'appuiera sur les outils suivants pour sa réalisation:
- Git (git-scm.com) / GitHub (github.com): pour la gestion de versions du projet
- Travis (travis-ci.org): pour les tests unitaires afin de s'assurer du bon fonctionnement de l'application
- PlantUML (plantuml.com): pour la génération des différents schémas (diagrammes de classes, diagrammes de séquences, diagrammes pour le schéma relationnel, etc.)
- Pencil (pencil.evolus.vn): pour la création de mockups et interfaces simplifiées
- GanttProject (ganttproject.biz): pour la création du diagramme de Gantt et la répartition des tâches
- \+ différents outils qui pourraient être découverts durant la conception du programme

## Ressources à disposition et organisation
Le projet se déroulera sur tout le semestre pour un total de 90 heures de travail par personne, soit 540 heures de travail effectif sur 14 semaines. Cela représente environ 6 heures de travail par personne par semaine.
Une méthologie AGILE sera appliquée afin d'avoir un suivi de l'évolution du travail.

## Rendu
En plus des points évoqués dans les contraintes du cours PRO, le rendu sera de la forme suivante:
- Un fichier .jar qui représentera le programme
- Un fichier de configuration

## Indicateurs et évaluation des résultats
Les différentes itérations de la méthodologie AGILE permettront de quantifier l'avancement du travail et sa bonne réalisation.

## Annexes
- Planification
- Mockups de l'application
- Schémas préliminaires de la base de données
