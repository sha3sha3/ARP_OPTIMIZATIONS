#ifndef HELPER_H
#define HELPER_H

#include <stdio.h>
#include <stdlib.h>

#define MAX_LINE_LENGTH 100
#define MAX_FILE_SIZE 1024
#define USE_MACRO_LOG 0

typedef struct
{
    char playerName[MAX_LINE_LENGTH];
    char difficulty[MAX_LINE_LENGTH];
    int startingLevel;
} Config;

typedef Config *conf_ptr;

static inline __attribute__((always_inline)) void logConfig(const Config *config)
{
    printf("Plar Name: %s\n", config->playerName);
    printf("Difficulty: %s\n", config->difficulty);
    printf("Starting Level: %d\n", config->startingLevel);
}

#if USE_MACRO_LOG
#define LOGCONFIG(config)                                      \
    {                                                          \
        printf("Player Name: %s\n", config->playerName);       \
        printf("Difficulty: %s\n", config->difficulty);        \
        printf("Starting Level: %d\n", config->startingLevel); \
    }
#endif

#ifdef LOGCONFIG
#define LOG(conf)                                         \
    {                                                     \
        printf("[%d] at %s:\n", __LINE__, __FILE__);      \
        LOGCONFIG(conf);                                  \
    }
#else
#define LOG(conf)                                         \
    {                                                     \
        printf("[%d] at %s:\n", __LINE__, __FILE__);      \
        logConfig(gameConfig);                            \
    }
#endif

#endif
