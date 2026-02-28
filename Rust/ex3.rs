use std::io;

fn main() {
    // Запрос ввода у пользователя
    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Ошибка ввода");

    let mut n: i32 = match input.trim().parse() {
        Ok(num) => num,
        Err(_) => {
            println!("Неверный ввод. Пожалуйста, введите корректное число.");
            return;
        }
    };

    let mut sum_of_digits = 0;
    let mut product_of_digits = 1;
    while n > 0 {
        sum_of_digits += n % 10;
        product_of_digits *= n % 10;
        n /= 10;
    }
    println!("{} {} {}", sum_of_digits, product_of_digits, (sum_of_digits as i64 - product_of_digits as i64).abs());
}