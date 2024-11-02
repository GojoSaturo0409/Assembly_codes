#include<stdio.h>

long long int comb(long long int n,long long int r);
int main(){
    long long int n;
    scanf("%lld",&n);
    long long int r;
    scanf("%lld",&r);
    long long int res = comb(n,r);
    printf("%lld\n",res);
}