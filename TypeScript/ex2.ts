const readline = require('prompt-sync')({ sigint: true });
function transformEmail(input: string): string {
    let result: string[] = [];
    let i = 0;

    while (i < input.length && input[i] !== '@') {
        if (input[i] === '*') {
            while (i + 1 < input.length && input[i + 1] !== '@') {
                i++;
            }
            i++;
        } else if (isLetterOrDigit(input[i])) {
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
function isLetterOrDigit(char: string): boolean {
    return /[a-zA-Z0-9]/.test(char);
}

function main() {
    let N: number;
    N = parseInt(readline());
    let emails = new Set<string>();

    for (let i = 0; i < N; i++) {
        let transformed = transformEmail(readline());
        emails.add(transformed);
    }
}

main();