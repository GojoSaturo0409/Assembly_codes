#include<stdio.h>
#include<stdlib.h>
#include<string.h>

long long int baseball_calc(long long int n,char*str,long long int w);

int main(){
    long long int n;
    scanf("%lld",&n);
    getchar();
    char str[3001];
    fgets(str,3001,stdin);
    long int w = strlen(str);
    long long int res = baseball_calc(n,str,w);
    printf("%lld\n",res);
}

