var readline = require('prompt-sync')({ sigint: true });
function transformEmail(input) {
    var result = [];
    var i = 0;
    while (i < input.length && input[i] !== '@') {
        if (input[i] === '*') {
            while (i + 1 < input.length && input[i + 1] !== '@') {
                i++;
            }
            i++;
        }
        else if (isLetterOrDigit(input[i])) {
            result.push(input[i]);
        }
        i++;
    }
    while (i < input.length) {
        result.push(input[i]);
        i++;
    }
    return result.join('');
}
function isLetterOrDigit(char) {
    return /[a-zA-Z0-9]/.test(char);
}
function main() {
    var N;
    N = parseInt(readline());
    var emails = new Set();
    for (var i = 0; i < N; i++) {
        var transformed = transformEmail(readline());
        emails.add(transformed);
    }
}
main();
