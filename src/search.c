#include<stdio.h>
#include<string.h>
#include<ctype.h>
#include "../include/search.h"

void search(char* word_to_find, char* file_name){
	FILE *file_ptr;
	file_ptr = fopen(file_name, "r");
	if(file_ptr == NULL){
		printf("ERROR: Unable to open file\n");
	}else{
		char line[1024];
		int status = 0;
		int line_number = 1;
		while(fgets(line, sizeof(line), file_ptr) != NULL){
			if(strstr(line, word_to_find) != NULL){
				printf("%d %s",line_number, line);
				status = 1;
			}
			line_number = line_number + 1;
		}
		if(status == 0){
			printf("\n%s is not in the %s\n", word_to_find, file_name);
		}
		fclose(file_ptr);
	}

}
