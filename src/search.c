#include<stdio.h>
include<string.h>
#include<ctype.h>
#include "../include/search.h"

void search(char* word_to_find, char* file_name){
	FILE *file_ptr;
	file_ptr = fopen(file_name, "r");
	if(file_ptr == NULL){
		printf("ERROR: Unable to open file\n");
	}else{
		char line;
		bool status;
		while(fgets(line, sizeof(line), file) != NULL){
			if(strstr(line, word_to_find) != NULL){
				prinf("&s",line);
				status = true;
			} 				
		}
		if(status == false){
			printf("\n%s is not in the %s\n", word_to_find, file_name);
		}
	}
	fclose(file_ptr);
}
