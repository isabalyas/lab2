var readline = require('prompt-sync')({ sigint: true });
function main() {
    var inputStr = readline();
    var n = parseInt(inputStr);
    var sumOfDigits = 0;
    var productOfDigits = 1;
    while (n > 0) {
        sumOfDigits += n % 10;
        productOfDigits *= n % 10;
        n = Math.floor(n / 10);
    }
    console.log("".concat(sumOfDigits, " ").concat(productOfDigits, " ").concat(Math.abs(sumOfDigits - productOfDigits)));
}
main();
