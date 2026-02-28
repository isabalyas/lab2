const readline = require('prompt-sync')({ sigint: true });
function ex1(input: string): string[] {
    let substr = '';
    const res: string[] = [];
    let state = 0;

    for (const char of input) {
        if (char === '1') {
            if (state === 0) {
                state = 1;
                substr += '1';
            } else if (state === 1) {
                state = 2;
                substr += '1';
            } else if (state === 3) {
                substr += '1';
                res.push(substr);
                substr = '';
                state = 0;
            } else {
                state = 0;
                substr = '';
            }
        } else if (char === '0') {
            if (state === 1 || state === 2 || state === 3) {
                state = 3;
                substr += '0';
            } else {
                state = 0;
                substr = '';
            }
        } else {
            state = 0;
            substr = '';
        }
    }
    return res;
}
const inputStr : string = readline();
const res = ex1(inputStr);
for (var i : number = 0; i < res.length;i++){
    console.log(res[i])
}