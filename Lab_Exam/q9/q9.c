#include<stdio.h>
#include<stdlib.h>

long long int missing_pos_num(long long int n,long long int*arr);
int main(){
    long long int n;
    scanf("%lld",&n);
    long long int arr[n];
    for(int i = 0;i<n;i++){
        scanf("%lld",&arr[i]);
    }
    long long int res = missing_pos_num(n,arr);
    printf("%lld\n",res);

}