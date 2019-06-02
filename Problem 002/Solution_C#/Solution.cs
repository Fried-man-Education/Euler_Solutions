using System;

namespace Solution_C_
{
    class Solution
    {
        static void Main(string[] args)  
        { 
            Console.WriteLine(value());
        }
        // find even number fibonacci terms < 4 mil.
        static int value()
        {
            int one = 0;
            int two = 1;
            int total = 0;
            int evenTerms = 0;

            while (total < 4000000)
            {
                total = one + two;
                one = two;
                two = total;
                if (total % 2 == 0)
                {
                    evenTerms += total;
                }                
            }
            return evenTerms;
        }
    }
}
