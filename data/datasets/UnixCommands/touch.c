#include <utime.h>
#include<stdio.h>
int retvalue;
int main(int argc,char* argv[]){
if(argc!=2 || argv[1]=="--help"){
printf("Usage::touch textfileTomodify\n");
}
retvalue=utime(argv[1],NULL);
if(retvalue==0){
printf("Timestamp modified\n");
}
}
