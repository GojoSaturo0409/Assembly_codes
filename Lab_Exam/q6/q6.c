#include<stdio.h>
#include<stdlib.h>

long long int gcd_eval(long long int m,long long int n);
int main(){
    long long int m;
    scanf("%lld",&m);
    long long int n;
    scanf("%lld",&n);
    long long int res = gcd_eval(m,n);
    printf("%lld\n",res);
}