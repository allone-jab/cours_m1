# Réseaux - TP 2 - Boite à outil UDP (User Datagram Protocol)

## Objectifs 

* Ecrire une petitie bibliothèque de gestion des erreurs
* Manipuler le protocole *UDP* en C 
* Manipuler le protocole *UDP* en JAVA

## Extrait du cours sur UDP
```
Le protocole UDP fait parti de la couche *transport*. 
C'est un protocole simple, sans connexion. 
```

## En C

1. *man 3 perror*
2. *man 3 exit*
3. *man socket* à partir de ce manuel, vous aurez certainement d'autre lectures de page *man* à faire
4. Quels sont les arguments qu'il faut donner à la fonction *socket()* pour créer une socket *UDP* ? 
5. A quoi sert la fonction *bind* ? 
6. Qui du serveur ou du client doit faire appel à bind ? 



[Petit lexique et résumé du réseau en C : "Les Réseaux en C"](lietard.fr/teaching/rsx.md)

### Une première librairie: Gestion des erreurs 

Lorsqu'un programme fait des appels systèmes, il est essentiel de gérer correctement les erreurs. Nous allons donc commencer par créer une petite librairie pour gérer les erreurs que peuvent produire les appels systèmes. 


1. Que remarquez-vous comme point commun dans les valeurs de retour des fonctions ? 

Nous allons définir un fichier *error.h*. Partons de ce [modèle de fichier](lietard.fr/teaching/template.h). 

1. Définissez une constante de pré-processeur `ERR`. Quelle valeur allez-vous mettre ? 
2. Définissez une macro de pré-processeur `syserror(m,e)`. Avec *m* le message et *e* le code d'erreur renvoyé par votre programme. Quelle fonction allez-vous utiliser ? 
3. Définissez les constantes de pré-processeur suivantes: 

    1. NO_ERROR 0        
    2. SOCKET_ERROR 1
    3. BIND_ERROR 2
    
4. **DECLAREZ** (et non définissez) maintenant un tableau de chaîne de caractères.
5. Quel mot clé avez-vous utiliser ? Que signifie t-il ? 
6. Créez un fichier *error.c*. Partons de ce [modèle de fichier](lietard.fr/teaching/template.c).
7. **DEFINISSEZ** le tableau des messages d'erreurs avec les chaînes de caractère suivantes: 
    1. No Error
    2. Error when creating socket
    3. Error when binding 
8. Définissez (dans le fichier .h) la macro `neterror(n)`, elle doit appelée `syserror` et utilisée votre tableau. 

### Serveur 

Ici faire les inclusions necessaires au bon fonctionnement de votre programme est demandé de manière implicite ... 

1. Créez une structure `server` composée de :
    1. un `int` correspondant au *file descriptor*;
    2. deux champs de type `struct sockaddr_in` pour le serveur et le client;
    3. un champs de type `socklen_t`;

1. Créez un nouveau type `Server` correpondant à un `struct server*` 
2. Créez la fonction `Server server_create_udp()` permettant de créer un nouveau `Server`
3. Créez la fonction `void server_close_and_free(Server this)` permettant de fermer le file descriptor se trouvant dans  `this` et de libérer l'espace ocupper par ce dernier 
4. Créez la fonction privée `void server_bind(Server this,int port)` qui se chargera d'initialiser les champs du `sockaddr_in` de this ainsi que de faire appel à l'appel système: `bind`
5. Créez la fonction privée `ssize_t server_receive_udp(Server this,char*buf,size_t size)` qui permettra de recevoir des données. 
6. Créez la fonction privée `void server_send_udp(Server this,char*msg)` qui permettra d'envoyer des données. 
7. Ajoutez un pointeur de fonction `server_bind`  dans la structure *Server*
8. Ajoutez un pointeur de fonction `server_receive`  dans la structure *Server*
9. Ajoutez un pointeur de fonction `server_send` dans la structure *Server*
10. Créez maintenant la fonction main dans un fichier main.c
```c
#define MAX 500
int main(){
    char buf[MAX];
    char *msg;
    //Création d'une structure Server
    
    //bind server
    
    for(;;){
        //réception d'un message:
        
        //si le message est PING alors on retourne au client PONG
        if(){
        
        }else{//Sinon le message à retourner est PAS PONG 
        
        }
        
        printf("%s\n",buf);
        //On envoie le msg
        
        
    }
    
    return 0;
}
```

### Client 
1. Créez une structure `client` composée de :
    1. un `int` correspondant au *file descriptor*;
    2. un champs de type `struct sockaddr_in`;
    3. un champs de type `socklen_t`;

1. Créez un nouveau type `Client` correpondant à un `server*` 
2. Créez la fonction `Client client_create_udp()` permettant de créer un nouveau `Server`
3. Créez la fonction `void client_close_and_free(Client this)` permettant de fermer le file descriptor se trouvant dans  `this` et de libérer l'espace ocupper par ce dernier 
4. Créez la fonction privée `ssize_t client_receive_udp(struct server* this,char*buf,size_t size)` qui permettra de recevoir des données. 
5. Créez la fonction privée `void client_send_udp(struct server* this,char*msg)` qui permettra d'envoyer des données. 
6. Ajoutez un pointeur de fonction `client_receive` la structure `Client`
7. Ajoutez un pointeur de fonction `client_send` la structure `Client`
8. Créez maintenant la fonction main dans un fichier main_client.c


```c
#define MAX 20

/* private functions =========================================== */

static void get_msg(char* msg){
   //récupére un message de l'utilisateur 
}

/* public functions =========================================== */

int main(){
    //Création d'un client 
    
    //les buffers
    char buffer_send[SIZE];
    char buffer_recv[SIZE];
    
    //initialisation à 0 des buffers 
    
    for(;;) {
        get_msg(buffer_send);
        //si le message est "exit" on quitte
        if(){
            break;
        }
        
        //on envoie le message
        
        //on reçoit
        
        //on affiche
        printf("%s\n", buffer_recv);
    }
    client_close_and_free(clt);
    exit(0);
}
```


## En Java

Il y a des points communs avec la version C. 

Ici il suffit de réaliser deux classes `̀Serveur.java` et `Client.java`. 

Vous aurez besoin de: 
* [DatagramSocket](https://docs.oracle.com/javase/8/docs/api/java/net/DatagramSocket.html)
* [DatagramPacket](https://docs.oracle.com/javase/8/docs/api/java/net/DatagramPacket.html)

