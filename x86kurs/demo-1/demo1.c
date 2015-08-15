#include<stdio.h>
#include<string.h>

//compile with gcc -ggdb -mpreferred-stack-boundary=2 -o demo1 demo1.c

canNeverExecute(){
	printf("can never execute !\n");
}

getData(){
	char buffer[8];
	gets(buffer);
	puts(buffer);
}

main(){
	getData();
	return 0;
}

