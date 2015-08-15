

#include<stdio.h>

foo(){
	int a = 20;
	int * r = (int *) &r + 6;
	*r = a;
	a = a + 20 ;
}

bar(){
	int a = 30;
	a = a + 100;
}


main (){
	int a = 10;
	foo();
	printf("%d\n",a);
}
