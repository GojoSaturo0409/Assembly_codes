#include<stdio.h>
#include<stdlib.h>

long long int*sorting(long long int n,long long int*arr);
int main(){
    long long int n;
    scanf("%lld",&n);
    long long int arr[n];
    for(int i = 0;i<n;i++){
        scanf("%lld",&arr[i]);
    }
    sorting(n,arr);
    for(int i = 0;i<n;i++){
        printf("%lld ",arr[i]);
    }
    printf("\n");
}