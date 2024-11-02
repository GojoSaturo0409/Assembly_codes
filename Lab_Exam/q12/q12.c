#include<stdio.h>
#include<stdlib.h>

long long int factorial_sum(long long int n);
int main(){
    long long int n;
    scanf("%lld",&n);
    long long int res = factorial_sum(n);
    if(res == 1){
        printf("TRUE\n");
    }
    else if (res == 0){
        printf("FALSE\n");
    }

}