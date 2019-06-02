/*
    Problem #: 1
    Author: Zachary "Zach" Lloyd
    Created: 06/01/2019
*/

using System;

namespace zach_solone
{
    class Solution
    {
        static void Main(string[] args) //Main Function to run
        {
            Console.WriteLine(test()); //print out the return from the int
        }
        static int test()
        {
            int num; //number to iterate over
            int total = 0; //total starts at 0
            int max_num = 1000; //max number to iterate to

            for (num = 0; num < max_num; num++) //for number starting at 0, moving to 1000, going up by 1 each time
            {
                if (num % 3 == 0) //if there is no remainder when dividing by 3
                {
                    total += num; //the total is added by the num being iterated
                }
                else if (num % 5 == 0) //if there is no remainder when dividing by 5
                {
                    total += num; //the total is added by the num being iterated
                }
            }

            return total; //return the final value
        }
    }

}
