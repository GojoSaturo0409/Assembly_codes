#include<stdio.h>
#include<stdlib.h>
#include<string.h>

long long int post_fix_eval(long long int n, char*str);

int main(){
    long long int n;
   scanf("%lld",&n);
    getchar();
    char str[n+1];
    fgets(str,n+1,stdin);
    // long int w = strlen(str);
    // printf("%ld\n",w);
    long long int res = post_fix_eval(n,str);    
    printf("%lld\n",res);
}