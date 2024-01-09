#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helper.h"


int main() {
    FILE *file;
    char line[MAX_LINE_LENGTH];
    char playerName[MAX_LINE_LENGTH];
    char difficulty[MAX_LINE_LENGTH];
    int startingLevel = 0;

    file = fopen("appsettings.conf", "r");//read mode "r", write "w"

    if (file == NULL) {
        perror("Error opening the file");
        return EXIT_FAILURE;//1
    }

    // loop on all the lines
    while (fgets(line, sizeof(line), file)) {
        // Removing line terminator
        line[strcspn(line, "\n")] = 0;

        // Tokenize the line to extract key-value pairs
        char *token = strtok(line, "=");
        if (token != NULL) {
            if (strcmp(token, "PlayerName") == 0) {
                token = strtok(NULL, "=");
                strcpy(playerName, token);
            } else if (strcmp(token, "Difficulty") == 0) {
                token = strtok(NULL, "=");
                strcpy(difficulty, token);
            } else if (strcmp(token, "StartingLevel") == 0) {
                token = strtok(NULL, "=");
                startingLevel = atoi(token);
            }
        }
    }

    fclose(file);//closing the file

    conf_ptr gameConfig = malloc(sizeof(conf_ptr));

    strcpy(gameConfig->difficulty,difficulty);
    strcpy(gameConfig->playerName,playerName);
    gameConfig->startingLevel = startingLevel;

    LOG(gameConfig);

    free(gameConfig);
    
    return EXIT_SUCCESS;//0
}