var readline = require('prompt-sync')({ sigint: true });
function ex1(input) {
    var substr = '';
    var res = [];
    var state = 0;
    for (var _i = 0, input_1 = input; _i < input_1.length; _i++) {
        var char = input_1[_i];
        if (char === '1') {
            if (state === 0) {
                state = 1;
                substr += '1';
            }
            else if (state === 1) {
                state = 2;
                substr += '1';
            }
            else if (state === 3) {
                substr += '1';
                res.push(substr);
                substr = '';
                state = 0;
            }
            else {
                state = 0;
                substr = '';
            }
        }
        else if (char === '0') {
            if (state === 1 || state === 2 || state === 3) {
                state = 3;
                substr += '0';
            }
            else {
                state = 0;
                substr = '';
            }
        }
        else {
            state = 0;
            substr = '';
        }
    }
    return res;
}
var inputStr = readline();
var res = ex1(inputStr);
for (var i = 0; i < res.length; i++) {
    console.log(res[i]);
}
