#include <iostream>
#include <cmath>
using namespace std;

int sumOfDigits(int num) {
    int sum = 0;
    int temp = num;
    
    while (temp > 0) {
        sum += temp % 10;
        temp /= 10;
    }
    return sum;
}

int productOfDigits(int num) {
    int product = 1;
    int temp = num;
    
    if (num == 0) return 0;
    
    while (temp > 0) {
        product *= temp % 10;
        temp /= 10;
    }
    return product;
}

int main() {
    int n;
    cin >> n;
    
    for (int i = 0; i < n; i++) {
        int num;
        cin >> num;
        
        if (num == 0) {
            cout << "0 0 0" << endl;
            continue;
        }
        
        int sum = sumOfDigits(num);
        int product = productOfDigits(num);
        
        cout << sum << " " << product << " " << abs(sum - product) << endl;
    }
    
    return 0;
}