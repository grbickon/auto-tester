/*
 * Echo single argument to standard out.
 */

#include <stdio.h>

int main(int argc, char **argv) {

    if (argc != 2) {
        printf("Exactly one argument required");
        return 1;
    }
    printf("%s\n", argv[1]);
    return 0;
}
