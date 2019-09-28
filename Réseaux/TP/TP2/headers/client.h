#ifndef CLIENT_H
#define CLIENT_H

#include "netinet/in.h"
#include "server.h"

struct _client {
    int fd;
    struct sockaddr_in sock_addr;
    socklen_t sock_len;
    ssize_t (*client_receive);
    void (*client_send);
};

typedef struct _server* Client;

Client client_create_udp();

void client_close_and_free(Client this);

ssize_t client_receive_udp(struct _server* this, char* buf, size_t size);

void client_send_udp(struct _server* this, char* msg);

#endif