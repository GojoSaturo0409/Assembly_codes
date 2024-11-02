#include<stdio.h>
#include<stdlib.h>
#include<string.h>
long long int is_palindrome(char*str,long long int length); //function definition
int main(){
    long long int bufSize = 10001; //the constraints are that the word size is from 1 to 10^4
    char str[10001];
    scanf("%s",str);//scanning the input string
    
    long long int length = strlen(str);//taking length of the string
    long long int ans = is_palindrome(str,length);
    printf("%lld\n",ans);
}