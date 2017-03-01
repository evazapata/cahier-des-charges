1. Un serveur est associé à un compte utilisateur.
2. Un client se connecte : envoi de la playlist en cours de lecture, du titre, etc...
3. À chaque nouvelle connexion, un nouveau thread est créé. Quand la connexion est fermée, on le termine.
4. Nombre limité de connexions en parallèle. 100 ? Possible de modifier cette valeur dans les réglages.
5. Si le nombre maximal de connexions a été atteint, on envoie un message d'alerte au client.
6. Un client envoie la première musique. Celle-ci est récupérée et sauvegardée dans un "cache" local.
7. Stockage de chaque musique dans le cache pendant un temps déterminé après la coupure du serveur. 6 heures ? Possible de modifier cette valeur dans les réglages.
8. On récupère le hash de chaque fichier streamé pour ensuite l'utiliser afin de récupérer le fichier dans le cache s'il existe déjà.
9. Vérification que le fichier envoyé par le client est bien un fichier audio. Si ce n'est pas le cas, envoi d'une alerte au client.
10. Formats pris en compte par l'application : `MP3`, `AAC`. Possibilité d'en ajouter par la suite.
11. Chaque client a le droit de faire play/pause sur la musique en cours de lecture.
12. Une musique est caractérisée par un nombre d'*upvotes*.
13. La playlist est une queue de priorité prenant en compte les *upvotes*.
14. Chaque client peut *upvote* ou *downvote* qu'une **seule** fois chaque musique.
15. Si le client *upvote* une musique, celle-ci est enregistrée dans sa liste de musiques *upvotées*.
16. Si la musique obtient un certain score (-5 par défaut), elle est supprimée de la playlist ou, si elle est en cours de lecture, la musique suivante est jouée. Possibilité de modifier ce score dans les réglages.
17. Le client peut enregistrer une playlist. Elle sera visible par ce dernier indéfiniment.
18. Une playlist est mise à jour dans la base de données jusqu'à ce que le serveur se coupe.
19. Dans chaque playlist présente dans la base de données, seules les métadonnées des musiques sont enregistrées (titre, artiste, durée).
20. Un client peut choisir parmi une liste de serveurs locaux, si plusieurs sont disponibles.
21. Un client est caractérisé par un pseudo et un score de karma.
22. Le score de karma correspond aux *upvotes* et *likes* d'une playlist.
23. Le score de karma d'un utilisateur est augmenté d'un point si une des musiques qu'il a proposé est *upvotée*.
24. Le score de karma d'un utilisateur est diminué d'un point si une des musiques qu'il a proposé est *downvotée*.
25. Le score de karma d'un utilisateur est augmenté de 10 points si une de ces playlists est *likée*.
26. Le score de karma d'un utilisateur est diminué de 10 points si une de ces playlists n'est plus *likée* par un autre utilisateur.
27. Une playlist est caractérisée par une liste de musiques, un titre et un créateur.
28. Un utilisateur peut associer son compte SoundCloud à son compte de l'application afin de streamer des musiques depuis SoundCloud.
29. Lors de la création d'un compte, l'utilisateur doit renseigner nom, prénom, pseudo, email et mot de passe.
30.
