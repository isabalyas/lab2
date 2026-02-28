using System;
using System.Collections.Generic;
using System.Text;
class Program
{
    static List<string> Ex1(string input)
    {
        StringBuilder substr = new StringBuilder();
        List<string> res = new List<string>();
        int state = 0;

        foreach (char ch in input)
        {
            if (ch == '1')
            {
                if (state == 0)
                {
                    state = 1;
                    substr.Append('1');
                }
                else if (state == 1)
                {
                    state = 2;
                    substr.Append('1');
                }
                else if (state == 3)
                {
                    substr.Append('1');
                    res.Add(substr.ToString());
                    substr.Clear();
                    state = 0;
                }
                else
                {
                    state = 0;
                    substr.Clear();
                }
            }
            else if (ch == '0')
            {
                if (state == 1 || state == 2 || state == 3)
                {
                    state = 3;
                    substr.Append('0');
                }
                else
                {
                    state = 0;
                    substr.Clear();
                }
            }
            else
            {
                state = 0;
                substr.Clear();
            }
        }
        return res;
    }

    static void Main()
    {
        string input = Console.ReadLine();
        List<string> result = Ex1(input);

        foreach (string item in result)
        {
            Console.WriteLine(item);
        }
    }
}
