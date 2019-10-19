#ifndef ERRORS_H 
#define ERRORS_H

#define ERR -1
#define NO_ERROR 0        
#define SOCKET_ERROR 1
#define BIND_ERROR 2
#define SEND_ERROR 3
#define LIST_ERROR 4
#define ACCP_ERROR 5

extern char* errors_tab[];

#define syserror(m,e) perror(m), exit(e);
#define neterror(n) syserror(errors_tab[n], n);

#endif