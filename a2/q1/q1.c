#include<stdio.h>
#include<stdlib.h>

long long int max_sum(long long int n, long long int l, long long int r, long long int *arr,long long int*prefix,long long int deque);
int main(){
    long long int n;
    scanf("%lld",&n);
    long long int l;
    scanf("%lld",&l);
    long long int r;
    scanf("%lld",&r);
    long long int arr[n];
    for(int i=0;i<n;i++){
        scanf("%lld",&arr[i]);
    }
    long long int prefix_sum[n+1];
    for(int i = 0;i<=n;i++){
        prefix_sum[i] = 0;
    }
    long long int deque = -999999999999;
    
    long long int result = max_sum(n,l,r,arr,prefix_sum,deque);
    printf("%lld\n",result);

}