#include <cstdio>
#include <cmath>



int main() {
    uint N = 0;
    uint digit = 0 ;
    uint sum = 0;
    uint product = 1;
    scanf("%u",&N);


    while (N > 0) {
        digit = N%10;
        sum+=digit;
        product *= digit;
        N/=10;
    }
    printf("%u %u %u",sum,product,abs(sum-product));
}