#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helper.h"
#include "cJSON/cJSON.h"

int main() 
{
    FILE *file;
    char jsonBuffer[MAX_FILE_SIZE];
    char playerName[MAX_LINE_LENGTH];
    char difficulty[MAX_LINE_LENGTH];

    file = fopen("appsettings.json", "r");

    if (file == NULL) {
        perror("Error opening the file");
        return EXIT_FAILURE;//1
    }

    int len = fread(jsonBuffer, 1, sizeof(jsonBuffer), file); 
    fclose(file);

    cJSON *json = cJSON_Parse(jsonBuffer);// parse the text to json object

    if (json == NULL)
    {
        perror("Error parsing the file");
        return EXIT_FAILURE;
    }

    conf_ptr gameConfig = malloc(sizeof(conf_ptr));
    
    strcpy(gameConfig->difficulty, cJSON_GetObjectItemCaseSensitive(json, "PlayerName")->valuestring);
    strcpy(gameConfig->playerName, cJSON_GetObjectItemCaseSensitive(json, "Difficulty")->valuestring);
    gameConfig->startingLevel = cJSON_GetObjectItemCaseSensitive(json, "StartingLevel")->valueint;
    
    LOG(gameConfig);

    cJSON *preferences = cJSON_GetObjectItemCaseSensitive(json,"Preferences");//this is a child of parent object json
    printf("Class: %s\n", cJSON_GetObjectItemCaseSensitive(preferences, "Class")->valuestring); 

    cJSON *numbersArray = cJSON_GetObjectItem(preferences, "StartingPoints");//this is an array
    int arraySize = cJSON_GetArraySize(numbersArray);
    for (int i = 0; i < arraySize; ++i) {
        cJSON *element = cJSON_GetArrayItem(numbersArray, i);
        if (cJSON_IsNumber(element)) {
            printf("StartingPoint [%d]: %d\n", i+1 ,element->valueint);
        }
    }

    cJSON_Delete(json);//clean
    
    free(gameConfig);//malloc --> clean

    return EXIT_SUCCESS;//0
}