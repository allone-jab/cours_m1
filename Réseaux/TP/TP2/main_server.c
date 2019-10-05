#include "headers/errors.h"
#include "headers/server.h"


#define MAX 500
#define PORT 8080

Server server_create_udp() {
    Server server = (Server)malloc(sizeof(struct _server));

    if((server->fd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        perror("Socket creation failed");
        exit(SOCKET_ERROR);
    }

    server->server.sin_family = AF_INET;
    server->server.sin_addr.s_addr = "127.0.0.1";
    server->server.sin_port = PORT;

    return server;
}

void server_close_and_free(Server this){
    close(this->fd);
    free(this);
}

void server_bind(Server this, int port) {
    if(bind(this->fd, (const struct sockaddr *)&this->server, sizeof(this->server)) < 0) {
        perror("Binding failed");
        exit(BIND_ERROR);
    }
}

ssize_t server_receive_udp(Server this, char* buf, size_t size) {
    ssize_t n = recvfrom(this->fd, (char*)buf, size, MSG_PEEK, (struct sockaddr * restrict)&this->client, &this->sock_len);
    buf[n] = '\0';
    return n;
}

void server_send_udp(Server this, char* msg) {
    sendto(this->fd, (char*)msg,strlen(msg), MSG_CONFIRM, (const struct sockaddr *)&this->server, this->sock_len);
}

int main(){
    char buffer[MAX];
    char *msg;

    Server server = server_create_udp();
    server_bind(server, PORT);
    for(;;){

        server_receive_udp(server, buffer, MAX);

        if(strcmp("PING", buffer) == 0){
            msg = "PONG";
        }else{
            msg = "PAS PONG";
        }

        //On envoie le msg
        server_send_udp(server, msg);
        
    }
    
    return 0;
}
