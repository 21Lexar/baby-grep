#include<stdio.h>
#include "include/search.h"

int main(int argc, char* argv){
	if(argc == 3){
		char* word_to_find = argv[1];
		char* file_name = argv[2];
		search(word_to_find, file_name);
	}
	return 0;
}
