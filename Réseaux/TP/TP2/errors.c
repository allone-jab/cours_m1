/**
* TP 2
* \file errors.c
* \brief résumé
* \author Tony Delattre
*/

#include "errors.h"

void server_bind(Server server, int port) {
    server->server.sin_port = port;
    server->client.sin_port = port;
    
}

Server server_create_udp(){
    Server server = (Server)malloc(sizeof(struct _server));
    return server;
}

void server_close_and_free(Server this){
    close(this->fd);
    free(this);
}

int main() {
    errors_tab = (char**)malloc(sizeof(char*)*3);
    errors_tab[0] = "Pas d'erreur.";
    errors_tab[1] = "Erreur de Socket.";
    errors_tab[2] = "Erreur de Bind";

    neterror(2);    
}
