/**
* TP 2
* \file errors.h
* \brief Contains basic errors
* \author Tony Delattre
*/

#ifndef PROJET_MODULE_H 
#define PROJET_MODULE_H

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <errno.h>
#include <netinet/in.h>
#include <unistd.h>

#define ERR -1
#define NO_ERROR 0        
#define SOCKET_ERROR 1
#define BIND_ERROR 2

char** errors_tab;

#define syserror(m,e) perror(errors_tab[e]);
#define neterror(n) syserror(errors_tab[n], n);

struct _server {
    int fd;
    struct sockaddr_in server;
    struct sockaddr_in client;
    socklen_t sock_len;
};

typedef struct _server* Server;

void server_bind(Server server, int port);

Server server_create_udp();

void server_close_and_free(Server server);

#endif