#include <iostream>
using namespace std;

int main() {
    // 여기에 코드를 작성해주세요.
    int n;

    cin >> n;
    cout << n * n;

    if (n < 5) {
        cout << endl;
        cout << "tiny";
    }
        
    return 0;
}