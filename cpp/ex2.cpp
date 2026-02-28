#include <iostream>
#include <set>
#include <string>
#include <cctype>

std::string transform(const std::string& input) {
    std::string res;
    int i = 0;
    
    if (input[0] == '.') {
        return "";
    }
    
    for (i = 0; input[i] != '@'; i++) {
        if (input[i] == '+') {
            while (input[i + 1] != '@') {
                i++;
            }
        }
        else if (std::isalnum(input[i])) {
            res.push_back(input[i]);
        }
    }
    
    if (i > 0 && input[i-1] == '.') {
        return "";
    }
    
    if (res.length() < 6 || res.length() > 30) {
        return "";
    }
    
    for (; i < input.size(); i++) {
        res.push_back(input[i]);
    }
    
    return res;
}

int main() {
    std::set<std::string> emails;
    int N;
    std::cin >> N;
    
    for (int i = 0; i < N; i++) {
        std::string email;
        std::cin >> email;
        std::string transformed = transform(email);
        if (!transformed.empty()) {
            emails.insert(transformed);
        }
    }
    
    std::cout << emails.size() << std::endl;
    return 0;
}