using System;

namespace Problem_009
{
    class Program
    {
        static void Main(string[] args)
        {
            for (int a = 0; a < 1000; a++)
            {
                for (int b = 0; b < 1000; b++)
                {
                    if (MathF.Sqrt(MathF.Pow(a, 2) + MathF.Pow(b, 2)) % 1 == 0)
                    {
                        int c = (int)MathF.Sqrt(MathF.Pow(a, 2) + MathF.Pow(b, 2));
                        if (a + b + c == 1000)
                        {
                            if (a < b && b < c)
                            {
                                Console.WriteLine("Solution:");
                                Console.WriteLine("a: " + a);
                                Console.WriteLine("b: " + b);
                                Console.WriteLine("c: " + c);
                            }
                        }
                    }
                }
            }
        }
    }
}
