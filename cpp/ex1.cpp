#include <iostream>
#include <vector>

std::vector<std::string> ex1(const std::string& input) {
    std::string substr;
    std::vector<std::string> res;
    int state = 0;
    for (int i = 0; i < input.length(); i++) {
        if (input[i] == '1') {
            if (state == 0) {
                state = 1;
                substr.push_back('1');
            } else if (state == 1) {
                state = 2;
                substr.push_back('1');
            } else if (state == 3){
                substr.push_back('1');
                res.push_back(substr);
                substr.clear();
                state = 0;
            } else {
                state = 0;
                substr.clear();
            }
        }
        else if (input[i] == '0') {
            if (state == 1 or state == 2 or state == 3) {
                state = 3;
                substr.push_back('0');
            } else {
                state = 0;
                substr.clear();
            }
        } else {
            state = 0;
            substr.clear();
        }
    }
    return res;
}

int main() {
    std::string input;
    std::getline(std::cin, input);
    std::vector<std::string> res = ex1(input);
    for (int i = 0; i < res.size(); i++) {
        std::cout << res[i] << std::endl;
    }
    return 0;
}
