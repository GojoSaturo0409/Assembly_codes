#include<stdio.h>

long long int pal_check(long long int n);
int main(){
    long long int n;
    scanf("%lld",&n);
    long long int res = pal_check(n);
    if (res == 1){
        printf("True\n");
    }
    else{
        printf("False\n");
    }

}