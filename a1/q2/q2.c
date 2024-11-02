#include<stdio.h>

void rotate_left(long long int n,long long int*arr);//function definition
int main(){
    long long int n;//number of elements in array
    scanf("%lld",&n);
    long long int arr[n];
    for(int i=0;i<n;i++){
        scanf("%lld",&arr[i]); // input elements of the array
    }
    rotate_left(n,arr);// function to perform left rotation,since it is a void function it has no return type
    for(int i = 0;i<n;i++){
        printf("%lld ",arr[i]); // printing the function after the left rotation
    }
    printf("\n");
}