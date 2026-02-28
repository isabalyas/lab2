
N = gets.to_i

sum_of_digits = 0
product_of_digits = 1

while N > 0
  sum_of_digits += N % 10
  product_of_digits *= N % 10
  N /= 10
end

puts "#{sum_of_digits} #{product_of_digits} #{(sum_of_digits - product_of_digits).abs}"