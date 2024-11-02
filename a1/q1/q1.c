#include<stdio.h>
typedef long long int ll;
ll lonely_number(ll n,ll*arr); //function definition
int main(){
    long long int n;
    scanf("%lld",&n);//taking number of elements as input
    long long int arr[2*n+1];
    for(int i=0;i<(2*n+1);i++){
        scanf("%lld",&arr[i]); //input if values of the array
    }
    long long int ans = lonely_number(n,arr);//return value from q1.s is stored in ans
    printf("%lld\n",ans);

}