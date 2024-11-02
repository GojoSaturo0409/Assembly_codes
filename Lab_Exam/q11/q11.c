#include<stdio.h>
#include<stdlib.h>

long long int*left_or_right(long long int n,long long int*arr,long long int*res);
int main(){
    long long int n;
    scanf("%lld",&n);
    long long int arr[n];
    for(int  i = 0;i<n;i++){
        scanf("%lld",&arr[i]);
    }
    long long int res[n];
    for(int i = 0;i<n;i++){
        res[i] = 0;
    }
    left_or_right(n,arr,res);
    for (int i = 0;i<n;i++){
        printf("%lld ",res[i]);
    }
    printf("\n");
}