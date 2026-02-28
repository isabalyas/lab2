def transform_email(input_email):
    if input_email[0] == '.':
        return ""
    
    result = []
    i = 0
    
    while i < len(input_email) and input_email[i] != '@':
        if input_email[i] == '+':
            while i + 1 < len(input_email) and input_email[i + 1] != '@':
                i += 1
        elif input_email[i].isdigit() or input_email[i].isalpha():
            result.append(input_email[i])
        i += 1
    
    if i > 0 and input_email[i-1] == '.':
        return ""
    
    if len(result) < 6 or len(result) > 30:
        return ""
    
    while i < len(input_email):
        result.append(input_email[i])
        i += 1
    
    return ''.join(result)

def main():
    N = int(input())
    emails = set()
    
    for _ in range(N):
        email = input()
        transformed = transform_email(email)
        if transformed:
            emails.add(transformed)
    
    print(len(emails))

if __name__ == "__main__":
    main()