#!/usr/bin/pike

int main()
{
    int frequency = 0;
    while (string a = Stdio.stdin.gets())
    {
        int current;
        sscanf(a, "%d\n", current);
        frequency += current;
    }
    write("Frequency: %d\n", frequency);
    return 0;
}
