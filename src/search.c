#include<stdio.h>
#include "../include/search.h"

void search(char* word_to_find, char* file_name){
	FILE *file_ptr;
	file_ptr = fopen(file_name, "r");
	if(file_ptr == NULL){
		printf("ERROR 255: Unable to open file\n");
	}else{
		char line;
		while(fgets(line, sizeof(line), file) != NULL){
			
			printf("&s", line);
		}

	}
	fclose(file_ptr);
}
