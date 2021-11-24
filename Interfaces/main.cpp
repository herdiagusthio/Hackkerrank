#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;
class AdvancedArithmetic{
    public:
        virtual int divisorSum(int n)=0;
};
class Calculator : public AdvancedArithmetic {
public:
    int divisorSum(int n) {
        // Final result of summation of divisors 
        int result = 0; 
    
        // find all divisors which divides 'num' 
        for (int i=2; i<=sqrt(n); i++) 
        { 
            // if 'i' is divisor of 'num' 
            if (n%i==0) 
            { 
                // if both divisors are same then add 
                // it only once else add both 
                if (i==(n/i)) 
                    result += i; 
                else
                    result += (i + n/i); 
            } 
        } 

        if (n == 1)
            result = result + 1;
        else
            result = result + 1 + n;
        // Add 1 to the result as 1 is also a divisor 
        return (result); 
    }
};

int main(){
    int n;
    cin >> n;
    AdvancedArithmetic *myCalculator = new Calculator(); 
    int sum = myCalculator->divisorSum(n);
    cout << "I implemented: AdvancedArithmetic\n" << sum;
    return 0;
}