#include <iostream>
using namespace std;

int main() {
    // 여기에 코드를 작성해주세요.
    int a, b;

    cin >> a;
    cin.get();
    cin >> b;

    if (a - b < 0)
        cout << b - a;
    else
        cout << a - b;
    return 0;
}