#include<stdio.h>
#include<stdlib.h>

long long int* product(long long int n,long long int*arr,long long int*ans);//function definition
int main(){
    long long int n;//number of elements in the array
    scanf("%lld",&n);
    long long int arr[n];//input array
    for(int i=0;i<n;i++){
        scanf("%lld",&arr[i]);
    }
    long long int *ans = (long long int*)malloc(n*sizeof(long long int));//answer array that is passed in the function
    product(n,arr,ans);
    for(int i = 0;i<n;i++){
        printf("%lld ",ans[i]);
    }
    printf("\n");
}