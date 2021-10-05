#include <iostream>
#include <math.h>
using namespace std;

int main ()
{
    float t = 0;
    float a = 0;
    for (int i = 0; i <= 9; i++)
    {
        if (i % 2 != 0) 
        {
            t = t + 4 * (a * cos(a));
        }
        else 
        {
            t = t + 2 * (a * cos(a));
        }
        a = a + 0.1;
    }
    t = t + cos(1);
    cout << t;
}