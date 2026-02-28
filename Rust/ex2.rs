use std::io::{self};
use std::collections::HashSet;

fn transform_email(email: &str) -> String {
    let mut result = String::new();
    let mut i = 0;

    while i < email.len() && email.as_bytes()[i] != b'@' {
        if email.as_bytes()[i] == b'*' {
            while i + 1 < email.len() && email.as_bytes()[i + 1] != b'@' {
                i += 1;
            }
            i += 1;
        } else if email.as_bytes()[i].is_ascii_alphanumeric() {
            result.push(email.chars().nth(i).unwrap());
        }
        i += 1;
    }

    // Добавляем оставшиеся символы
    while i < email.len() {
        result.push(email.chars().nth(i).unwrap());
        i += 1;
    }

    result
}

fn main() {
    let mut n = String::new();
    io::stdin().read_line(&mut n).expect("Ошибка ввода");
    let n = n.trim().parse::<usize>().expect("Некорректное число");

    let mut emails = HashSet::new();

    for _i in 0..n {
        let mut email = String::new();
        io::stdin().read_line(&mut email).expect("Ошибка ввода");
        let transformed = transform_email(email.trim());
        emails.insert(transformed);
    }

    println!("{}", emails.len());
}