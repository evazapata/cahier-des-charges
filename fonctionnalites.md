# Fonctionnalités de l'application
* Au lancement de l'app l'utilisateur choisi si il est serveur ou client.
* Possibilité de se créer un compte qui permet de sauvegarder des informations de
musiques passées ou des playlists.
* Possibilité de lier un compte Soundcloud avec l'application pour pouvoir streamer
du contenu de ce compte.
* AU départ l'app attend d'avoir une certain nombre de morceaux dans la file pour
commencer la diffusion.
* Vision de la file actuelle (fonctionnalité différentes si client ou serveur).
* Soumimssion de la musique:
 * Un client ou le serveur peut soumettre des musiques aux serveur. Elle sera enregistrée
 dans un cache local pendant une certaine durée sur le serveur (durée parametrable).
 * Vérification du type de fichier soumis avant enregistrement dans le serveur.
 Type de fichiers supportés: `MP3`, `AAC` en tout cas.
 * Une personne ne peut soumettre qu'un certain nombre parametrable de musiques par minute.
 Cela sert à éviter une surcharge du serveur de la part d'un utiisateur.
 * Les sons soumis sont mis dans une file d'attente.
 * L'ordre des sons dans la file peut être changé en fonction de leur score (voir
     fonctionnalité client) et de leur arrivée.
 * Un son qui n'a pas été passé depuis ? min/heure est supprimé de la file.
* Lors de la fermeture du serveur, Les informations (titre, artiste, durée) de la
musique en cours sont stockée dans une base de donnée pour pouvoir permettre aux
utilisateurs disposant d'un compte de récupérer ces informations ultérieurement.

## Fonctionnalités client
* Connexion à une salle créée par un serveur. Possilité de se switchere entre
différentes salles si il y'en a plusieures.
* Un client peut upvote ou downvote des sons de la file. Cela va influencer leur
priorité dans la file, voir les supprimer si ils ont atteint un nombre `x` de downvotes.
* Si le client à un compte, un système de renommée est mis en place:
 * Un compte gagne de la renommée si un son qu'il a soumis est passé.
 * A contrario il en perd si un son qu'il propose est downvotés trop de fois.
 * Il en gagne (un peu) si un son qu'il a upvote est passé.

## Fonctionnalités serveur
Création et nommage d'une salle.
Deux modes de fonctionnement:
* Manuel:
 * Peut modifier la file d'attente: supprimer des morceaux, en ajouter comme un client,
 modifier leur place, ...
 * Une personne est derière l'ordinateur et gère les sons tout en ayant les
fonctinnalité de la file comunautaire.
 * Peut créer une playlist qui sera soumise garce à une notification aux clients
 qui pourront alors l'accepter ou non. Ces playlists seront aussi enregistrées dans
 la base de donnée si elles sont acceptée.
* Automatique:
 * Avant de passer chaque morceaux, le serveur envoie une notification à ses clients
 pour qu'ils l'acceptent ou non (system OUI/NON).
 * Le système est géré uniquement par la file et donc directement par les utilisateurs.
 * Dans ce mode, possibilité de permettre aux utilisateurs de soumettre leur playlist.
 Celle-ci ne sera enregisrée dans la DB que si elle est acceptée par les autres
 clients.


## Autres
Possibilité d'avoir un modérateur pour un serveur qui aidera le serveur à gérer
la file.
