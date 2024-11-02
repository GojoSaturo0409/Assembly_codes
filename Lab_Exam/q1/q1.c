#include<stdio.h>

long long int calculator(long long int a,long long int b,long long int op);
int main(){
    long long int a;
    scanf("%lld",&a);
    long long int b;
    scanf("%lld",&b);
    long long int op;
    scanf("%lld",&op);
    long long int res = calculator(a,b,op);
    printf("%lld\n",res);
}