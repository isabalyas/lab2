const prompt = require('prompt-sync')({ sigint: true });

let N = parseInt(prompt());
let sum = 0;
let product = 1
while (N > 0) {
    sum += N % 10;
    product *= N % 10;
    N = Math.floor(N / 10);
}

console.log(`${sum} ${product} ${Math.abs(sum - product)}`);