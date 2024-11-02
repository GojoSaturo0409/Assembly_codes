#include<stdio.h>

long long int small_and_large(long long int n,long long int*arr);//function definition
int main(){
    long long int n;//number of elements in the array
    scanf("%lld",&n);
    long long int arr[n];
    for(int i=0;i<n;i++){
        scanf("%lld",&arr[i]);//elements of array
    }
    long long int ans = small_and_large(n,arr);
    printf("%lld\n",ans);
    
}