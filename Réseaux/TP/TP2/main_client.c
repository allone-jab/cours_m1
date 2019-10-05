#include "headers/client.h"
#include "headers/errors.h"
#include "headers/server.h"

#define MAX 20
#define PORT 8080

Client client_create_udp() {
    Client client = (Client)malloc(sizeof(struct _server));

    if((client->fd = socket(AF_INET, SOCK_DGRAM,0)) < 0){
        perror("Socket creation failed");
        exit(SOCKET_ERROR);
    }

    client->sock_addr.sin_family = AF_INET;
    client->sock_addr.sin_addr.s_addr = "127.0.0.1";
    client->sock_addr.sin_port = PORT;

    return client;
}

void client_close_and_free(Client this) {
    close(this->fd);
    free(this);
}

ssize_t client_receive_udp(Client this, char* buffer, size_t size) {
    ssize_t n = recvfrom(this->fd, (char*)buffer, size, MSG_PEEK, (struct sockaddr * restrict)&this->sock_addr, &this->sock_len);
    buffer[n] = '\0';
    return n;
}

void client_send_udp(Client this, char* msg) {
    sendto(this->fd, (char*)msg, strlen(msg), MSG_CONFIRM,(const struct sockaddr *)&this->sock_addr, this->sock_len);
}

static void get_msg(char* msg){
   getchar();
}

int main(){
    Client clt = client_create_udp();
    
    char buffer_send[MAX];
    char buffer_recv[MAX];
    
    *buffer_send = '\0';
    *buffer_recv = '\0';
    
    for(;;) {
        get_msg(buffer_send);

        if(strcmp("exit", buffer_send) == 0){
            break;
        }
        
        client_send_udp(clt, buffer_send);
        
        client_receive_udp(clt, buffer_recv, MAX);
        
        printf("%s\n", buffer_recv);
    }
    client_close_and_free(clt);
    exit(0);
}
