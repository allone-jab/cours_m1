# Réseaux - TP 1 - Quelques commandes sous UNIX

## Objectifs 

* Connaître les commandes de base impliquant du réseau sous linux
* Utiliser le manuel Linux


## ifconfig 

Permet de configurer et d'afficher les informations sur les différentes interfaces d'une machine. (pour plus d'informations: **man ifconfig** ). 

1. Quelle est l'adresse IP de votre machine ?
2. Quelle est l'adresse MAC de votre machine ? 
3. Sur quelles couches du modèle OSI interviennent ces deux adresses ?  

## Route 

Affiche la table de routage d'une machine (pour plus d'informations: **man route** )

1. Quelle est la destination par défaut de votre machine ?
2. Sur quelle couche du modèle OSI intervient cette commande ? 

## Ping 

1. A quoit sert cette commande ? 
2. Quel protocole est utilisé par cette commande ? 
3. Sur quelle couche du modèle OSI se trouve cette commande ? 
4. Contactez la machine de votre voisin.
5. Que répond *ping www.google.com* ?  Pourquoi ? 
6. Même question en utilisant l'outil web  [ping.eu](http://ping.eu/)

## Netcat
La commande *Netcat* permet de nombreuses utilisations impliquant des sockets TCP, UDP ou Unix (pour plus d'informations: **man nc**).

1. Lisez ce que vous pouvez faire avec la commande *netcat* 
2. Sur quelle couche du modèle OSI intervient cette commande ? 
3. Que permet de faire l'option *-l* ? 
4. Ouvez un serveur TCP, votre voisin un client TCP. Envoyez-vous des messages. 
5. Envoyez-vous un fichier texte, ou une image. Quelle commande faut-il taper ?  
6. Que faut-il faire pour passer du protocole TCP au protocole UDP ?  
7. Quels sont les ports ouverts sur votre machine ? 


## HTTP 
Le protocole HTTP est un protocole utilisant TCP. C'est le protocole utilisé par le WEB ([RFC 2616](https://tools.ietf.org/html/rfc2616)). 

Lorsque le navigateur demande une page à un serveur il envoie la requête suivante (on admet ici que l'on veut accéder à la racine du site): 
```
GET / HTTP/1.1\n
HOST: wwww.nomdedomaine.fr\n
\n
\n
```

1. Comment faire pour envoyer une requête *HTTP* à l'adresse [www.cril.univ-artois.fr](https://www.cril.univ-artois.fr) avec netcat et simuler la requête que ferait un navigateur ?

## SSH

1. A quoi sert cette commande ? 
2. Comment faire pour vous connecter sur la machine de votre voisin ?
3. Que pouvez faire sur le terminal distant ? 
4. Tapez la commande *who* sur la machine *recevant* la connexion SSH. Que remarquez-vous ?  


## Fichiers système  
1. Quel est le nom de votre machine ? (*/etc/hostname*)
2. Quels sont les machines enregistrées dans */etc/hosts*? A quoi sert ce fichier ? 


