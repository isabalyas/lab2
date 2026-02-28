using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
class Program
{
    static string TransformEmail(string input)
    {
        StringBuilder result = new StringBuilder();
        int i = 0;

        while (i < input.Length && input[i] != '@')
        {
            if (input[i] == '*')
            {
                while (i + 1 < input.Length && input[i + 1] != '@')
                {
                    i++;
                }
            }
            else if (char.IsDigit(input[i]) || char.IsLetter(input[i]))
            {
                result.Append(input[i]);
            }
            i++;
        }
        while (i < input.Length)
        {
            result.Append(input[i]);
            i++;
        }

        return result.ToString();
    }

    static void Main()
    {
        int N = int.Parse(Console.ReadLine());
        HashSet<string> emails = new HashSet<string>();

        for (int i = 0; i < N; i++)
        {
            string email = Console.ReadLine();
            string transformed = TransformEmail(email);
            emails.Add(transformed);
        }

        Console.WriteLine($"{emails.Count}");
    }
}