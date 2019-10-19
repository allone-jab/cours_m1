#ifndef CLIENT_H
#define CLIENT_H

#include <zconf.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

struct _client {
    int fd;
    struct sockaddr_in sock_addr;
    socklen_t sock_len;
    
    ssize_t (*client_receive) (struct _client**, char*, size_t);
    void (*client_send) (struct _client*, char*);
};

typedef struct _client* Client;

Client client_create_udp();

void client_close_and_free(Client this);

ssize_t client_receive_udp(Client this, char* buffer, size_t size);

void client_send_udp(Client this, char* msg);

#endif