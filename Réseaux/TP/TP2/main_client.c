#include <stdlib.h>
#include <memory.h>
#include "headers/client.h"
#include "headers/errors.h"

#define MAX 20
#define PORT 8080

Client client_create_udp(char* addr, int port) {
    Client client = (Client)malloc(sizeof(struct _client));

    if((client->fd = socket(AF_INET, SOCK_DGRAM,0)) < 0){
        free(client);
        neterror(SOCKET_ERROR);
    }

    memset(&client->sock_addr, 0, sizeof(struct sockaddr_in));
    client->sock_addr.sin_family = AF_INET;
    client->sock_addr.sin_port = htons((uint16_t) port);

    if(inet_aton(addr, &client->sock_addr.sin_addr) < 0) {
        neterror(SOCKET_ERROR);
    }
    client->sock_len = sizeof(struct sockaddr_in);

    return client;
}

void client_close_and_free(Client this) {
    close(this->fd);
    free(this);
}

ssize_t client_receive_udp(Client this, char* buffer, size_t size) {
    if(!buffer) return 0;
    return recvfrom(this->fd, (char*)buffer, size, MSG_PEEK, (struct sockaddr * restrict)&this->sock_addr, &this->sock_len);
}

void client_send_udp(Client this, char* msg) {
    if(sendto(this->fd, (char*)msg, strlen(msg), MSG_CONFIRM,(const struct sockaddr *)&this->sock_addr, this->sock_len) == ERR){
        neterror(SEND_ERROR);
    }
}

int main(){

}
