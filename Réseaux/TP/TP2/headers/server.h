#ifndef SERVER_H
#define SERVER_H

#include "netinet/in.h"

struct _server {
    int fd;
    struct sockaddr_in server;
    struct sockaddr_in client;
    socklen_t sock_len;
    void (*server_bind) (struct _server*, int);
    void (*server_receive) (struct _server*, char*, size_t);
    void (*server_send) (struct _server*, char*);
};

typedef struct _server* Server;

Server server_create_udp();

void server_close_and_free(Server server);

ssize_t server_receive_udp(Server this, char* buf, size_t size);

void server_send_udp(Server this, char* msg);

void server_bind(Server server, int port);

#endif