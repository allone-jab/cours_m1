/**
* TP 2
* \file errors.h
* \brief Contains basic errors
* \author Tony Delattre
*/

#ifndef ERRORS_H 
#define ERRORS_H

#include <errno.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#define ERR -1
#define NO_ERROR 0        
#define SOCKET_ERROR 1
#define BIND_ERROR 2

char** errors_tab;

#define syserror(m,e) perror(errors_tab[e]);
#define neterror(n) syserror(errors_tab[n], n);

#endif