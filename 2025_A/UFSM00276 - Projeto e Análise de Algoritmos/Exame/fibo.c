#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: %s <n>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);
    int i = 1, f = 0;

    for (int k = 1; k <= n; k++) {
        printf("Fibonacci(%d)\n\n", k);
        printf("f = (i) + (f)\n");
        printf("f = (%d) + (%d)\n\n", i, f);
        printf("i = (f) - (i)\n");
        printf("i = (%d) - (%d)\n\n", f, i);
        f = i + f;
        i = f - i;
        printf("f=(%d)   i=(%d)\n\n-----\n\n", f, i);
    }

    printf("Fibonacci(%d) = %d\n", n, f);
    return 0;
}
