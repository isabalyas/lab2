def sum_of_digits(num):
    sum_digits = 0
    temp = num
    while temp > 0:
        sum_digits += temp % 10
        temp //= 10
    return sum_digits

def product_of_digits(num):
    if num == 0:
        return 0
    
    product_digits = 1
    temp = num
    while temp > 0:
        product_digits *= temp % 10
        temp //= 10
    return product_digits

data = list(map(int, input().split()))
n = data[0]
numbers = data[1:n+1]

for num in numbers:
    if num == 0:
        print("0 0 0")
        continue
    
    sum_val = sum_of_digits(num)
    product_val = product_of_digits(num)
    
    print(f"{sum_val} {product_val} {abs(sum_val - product_val)}")