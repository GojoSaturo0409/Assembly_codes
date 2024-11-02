#include<stdio.h>
#include<stdlib.h>

long long int*binary_search(long long int*arr,long long int x,long long int*res);
int main(){
    long long int arr[32];
    for (int i=0;i<32;i++){
        scanf("%lld",&arr[i]);
    }
    long long int x;
    scanf("%lld",&x);
    long long int res[2];
    for(int i = 0;i<2;i++){
        res[i] = 0;
    }
    binary_search(arr,x,res);
    printf("%lld %lld\n",res[0],res[1]);
    
}