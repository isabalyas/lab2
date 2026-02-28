def ex1(input_str):
    substr = ''
    res = []
    state = 0

    for char in input_str:
        if char == '1':
            if state == 0:
                state = 1
                substr += '1'
            elif state == 1:
                state = 2
                substr += '1'
            elif state == 3:
                substr += '1'
                res.append(substr)
                substr = ''
                state = 0
            else:
                state = 0
                substr = ''
        elif char == '0':
            if state == 1 or state == 2 or state == 3:
                state = 3
                substr += '0'
            else:
                state = 0
                substr = ''
        else:
            state = 0
            substr = ''

    return res

input_str = input()
res = ex1(input_str)
for item in res:
    print(item)