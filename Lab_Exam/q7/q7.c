#include<stdio.h>
#include<stdlib.h>

long long int max_sum_b(long long int n,long long int b,long long int*arr);
int main(){
    long long int n;
    scanf("%lld",&n);
    long long int b;
    scanf("%lld",&b);
    long long int arr[n];
    for(int i = 0;i<n;i++){
        scanf("%lld",&arr[i]);
    }
    long long int res = max_sum_b(n,b,arr);
    printf("%lld\n",res);
}