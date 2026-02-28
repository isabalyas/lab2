using System;

class Program
{
    static void Main()
    {
        int N = Convert.ToInt32(Console.ReadLine());
        int sum = 0;
        int product = 1;
        while (N > 0)
        {
            sum += N % 10;
            product *= N % 10;
            N /= 10;
        }
        Console.WriteLine($"{sum} {product} {Math.Abs(sum - product)}");
    }
}