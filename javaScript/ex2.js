const prompt = require('prompt-sync')({ sigint: true });
function transformEmail(input) {
    let result = [];
    let i = 0;

    while (i < input.length && input[i] != '@') {
        if (input[i] === '*') {
            while (i + 1 < input.length && input[i + 1] != '@') {
                i++;
            }
            i++;
        } else if (/[a-zA-Z0-9]/.test(input[i])) {
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

function main() {

    let N = parseInt(prompt());
    let emails = new Set();

    for (let i = 0; i < N; i++) {
        let transformed = transformEmail(prompt());
        emails.add(transformed);
        if (i === N - 1) {
            console.log(`${emails.size}`);
        }
    }
}

main();