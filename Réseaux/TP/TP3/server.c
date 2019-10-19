#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "headers/server.h"

#define PORT 8080

char* errors_tab[] = {
    "No error", 
    "Error when creating Socket", 
    "Error when Binding", 
    "Error when Sending Message",
    "Error when listening"
};

Server init_server() {
    Server server = (Server)malloc(sizeof(struct _server));

    if((server->fd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        free(server);
        neterror(SOCKET_ERROR);
    }

    // server->server_bind = &server_bind;
    // server->server_receive = &server_receive_udp;
    // server->server_send = &server_send_udp;

    memset(&server->server, 0, sizeof(struct sockaddr_in));

    return server;
}

int server_listen(Server this) {
    return 0;
}
int server_accept(Server this) {
    {
	int err = 0;
	int conn_fd;
	socklen_t client_len;
	struct sockaddr_in client_addr;

	client_len = sizeof(client_addr);

	err =
	  (conn_fd = accept(
	     this->fd, (struct sockaddr*)&client_addr, &client_len));
	if (err == -1) {
		perror("accept");
		printf("failed accepting connection\n");
		return err;
	}

	printf("Client connected!\n");

	err = close(conn_fd);
	if (err == -1) {
		perror("close");
		printf("failed to close connection\n");
		return err;
	}

	return err;
}

int main(void) {
    Server this = init_server();
    printf("ok");

    if(server_listen(this)) {
        neterror(LIST_ERROR);
    }

    for(;;) {
        if(server_accept(this)) {
            neterror(ACCP_ERROR);
        }
    }
    exit(NO_ERROR);
}