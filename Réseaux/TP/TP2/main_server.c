#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "headers/errors.h"
#include "headers/server.h"

#define MAX 500
#define PORT 8080

Server server_create_udp() {
    Server server = (Server)malloc(sizeof(struct _server));

    if((server->fd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        free(server);
        neterror(SOCKET_ERROR);
    }

    server->server_bind = &server_bind;
    server->server_receive = &server_receive_udp;
    server->server_send = &server_send_udp;

    memset(&server->server, 0, sizeof(struct sockaddr_in));

    return server;
}

void server_close_and_free(Server this){
    close(this->fd);
    free(this);
}

void server_bind(Server this, int port) {
    this->server.sin_family = AF_INET;
    this->server.sin_addr.s_addr = INADDR_ANY;
    this->server.sin_port = htons((uint16_t) port);
    this->sock_len = sizeof(struct sockaddr_in);

    if(bind(this->fd, (const struct sockaddr *)&this->server, sizeof(this->server)) < 0) {
        neterror(BIND_ERROR);
    }
}

static ssize_t server_receive_udp(Server this, char* buf, size_t size) {
    return recvfrom(this->fd, (char*)buf, size, 0, (struct sockaddr * restrict)&this->client, &this->sock_len);
}

static void server_send_udp(Server this, char* msg) {
    if(sendto(this->fd, (char*)msg, strlen(msg), MSG_CONFIRM, (const struct sockaddr *)&this->server, this->sock_len) == ERR) {
        neterror(SEND_ERROR);
    };
}

int main(){

}
