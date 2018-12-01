#!/usr/bin/pike

int main(int c, array(string) v)
{
    if (c < 2)
        exit(10, "Usage: %s <filename>\n", v[0]);

    Stdio.File f = Stdio.File();

    if (!f->open(v[1], "r"))
        exit(20, "Failed to open %s (%s).\n", v[1], strerror(f->errno()));

    string raw = f->read();
    array(string) i_s = (raw / "\n") - ({ "" });
    array(int) input = (array(int))i_s;
    mapping(int:int) seen = ([ ]);

    int current = 0;
    int i = 0;
    while (!seen[current])
    {
        seen[current] = 1;
        current += input[i];
        i = ++i % sizeof(input);
    }
    write("Already seen: %d\n", current);
    return 0;
}
