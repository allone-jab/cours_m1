#ifndef SERVER_H
#define SERVER_H

#include <zconf.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "errors.h"

struct _server {
    int fd;
    struct sockaddr_in server;
    struct sockaddr_in client;
    socklen_t sock_len;

    ssize_t (*server_receive) (struct _server*, char*, size_t);
    void (*server_send) (struct _server*, char*);
    void (*server_bind) (struct _server*, int);
};

typedef struct _server* Server;

Server init_server();

int server_listen(Server s);

int server_accept(Server s);

#endif