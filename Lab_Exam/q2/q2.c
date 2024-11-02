#include<stdio.h>

long long int odd_checker(long long int num);
int main(){
    long long int num;
    scanf("%lld",&num);
    long long int res = odd_checker(num);
    if(res == 1){
        printf("TRUE\n");
    }
    else if (res == 0){
        printf("FALSE\n");
    }
}