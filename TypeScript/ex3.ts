const readline = require('prompt-sync')({ sigint: true });
function main() {
    const inputStr : string = readline();
    let n : number = parseInt(inputStr)

    let sumOfDigits = 0;
    let productOfDigits = 1;

    while (n > 0) {
        sumOfDigits += n % 10;
        productOfDigits *= n % 10;
        n = Math.floor(n / 10);
    }
    console.log(`${sumOfDigits} ${productOfDigits} ${Math.abs(sumOfDigits - productOfDigits)}`);
}
main()