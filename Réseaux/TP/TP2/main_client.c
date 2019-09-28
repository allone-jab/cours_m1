#include "headers/client.h"
#include "headers/server.h"
#include "headers/errors.h"

#define MAX 20

static void get_msg(char* msg){
   //récupére un message de l'utilisateur 
}

int main(){
    //Création d'un client 
    // Client clt;
    
    //les buffers
    char buffer_send[MAX];
    char buffer_recv[MAX];
    
    //initialisation à 0 des buffers 
    
    for(;;) {
        get_msg(buffer_send);
        //si le message est "exit" on quitte
        if(strcmp("exit", buffer_send) == 0){
            break;
        }
        
        //on envoie le message
        
        //on reçoit
        
        //on affiche
        printf("%s\n", buffer_recv);
    }
    // client_close_and_free(clt);
    exit(0);
}
