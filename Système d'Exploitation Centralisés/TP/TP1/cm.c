#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

#define ERR -1

#define NO_ERROR 0
#define OPEN_ERROR 1
#define READ_ERROR 2

int main(int argc, char** argv) {    
    int c, w, l, i; /* COUNTERS */
    int fd; /* FILE DESCRIPTOR */
    int nc; /* NUMBER OF CHARACTERS IN FILE */
    char curr;

    if((fd = open(argv[1], O_RDONLY)) == ERR){
        perror("Open error");
        exit(OPEN_ERROR);
    }   

    c = 0;
    w = 0;
    l = 0;

    while(read(fd, &curr, 1) > 0){
        c++;
        if(curr == ' ' || curr == '\t') w++;
        else if(curr == '\n') l++;
    };

    printf("%d %d %d\n", c, w, l);
    close(fd);
}