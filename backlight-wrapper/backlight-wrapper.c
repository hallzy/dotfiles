#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define BRIGHTNESS_FILE  "/sys/class/backlight/intel_backlight/brightness"

int main(int argc, char **argv) {
    int input;
    FILE *fp;

    if (argc != 2) {
        printf ("Expected an integer argument.\n");
        return 1;
    }

    input = atoi(argv[1]);

    if (input <= 0 || input > 2000) {
        printf("Input is out of bounds [%d]\n", input);
        return 1;
    }

    if (access(BRIGHTNESS_FILE, F_OK) == -1) {
        printf("Brightness file does not exist\n");
        return 1;
    }

    fp = fopen(BRIGHTNESS_FILE, "w");
    if (fp == NULL) {
        printf("Failed to open brightness file\n");
        return 1;
    }

    if (fprintf(fp, "%d", input) < 1) {
        printf ("Failed to write to brightness file\n");
        fclose(fp);
        return 1;
    }

    fclose(fp);
    return 0;
}
