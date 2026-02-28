use std::io::{self};

fn main() {
    let mut input = String::new();

    io::stdin()
        .read_line(&mut input)
        .expect("Не удалось прочитать строку");

    let result = ex1(&input);  // ← ИСПРАВЛЕНО: добавил &

    for item in result {
        println!("{}", item);
    }
}

fn ex1(input: &str) -> Vec<String> {
    let mut substr = String::new();
    let mut res = Vec::new();
    let mut state = 0;

    for ch in input.chars() {
        if ch == '1'{
            if state == 0 {
                state = 1;
                substr.push('1');
            } else if state == 1 {
                state = 2;
                substr.push('1');
            } else if state == 3 {
                substr.push('1');
                res.push(substr.clone());
                substr.clear();
                state = 0;
            } else {
                state = 0;
                substr.clear();
            }
        }
        else if ch == '0' {
            if state == 1 || state == 2 || state == 3 {
                state = 3;
                substr.push('0');
            } else {
                state = 0;
                substr.clear();
            }
        } else {
            state = 0;
            substr.clear();
        }
    }
    res
}