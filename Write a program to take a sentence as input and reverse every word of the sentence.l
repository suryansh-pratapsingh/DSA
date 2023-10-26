#include <stdio.h>
#include <string.h>

// Function to reverse a string
void reverseWord(char *start, char *end) {
    while (start < end) {
        char temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}

// Function to reverse every word in a sentence
void reverseSentenceWords(char *sentence) {
    int length = strlen(sentence);

    // Initialize pointers for the start and end of each word
    char *start = sentence;
    char *end = sentence;

    for (int i = 0; i <= length; i++) {
        if (sentence[i] == ' ' || sentence[i] == '\0') {
            // Found a word boundary or the end of the sentence
            end = &sentence[i - 1]; // Set 'end' to the last character of the word
            reverseWord(start, end); // Reverse the word
            start = &sentence[i + 1]; // Set 'start' to the first character of the next word
        }
    }
}

int main() {
    char sentence[1000];

    printf("Enter a sentence: ");
    fgets(sentence, sizeof(sentence), stdin);

    // Remove the trailing newline character from fgets
    if (sentence[strlen(sentence) - 1] == '\n') {
        sentence[strlen(sentence) - 1] = '\0';
    }

    // Reverse the words in the sentence
    reverseSentenceWords(sentence);

    // Print the reversed sentence
    printf("Reversed sentence: %s\n", sentence);

    return 0;
}
