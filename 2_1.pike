#!/usr/bin/pike

int main(int c, array(string) v)
{
    int two_count = 0;
    int three_count = 0;

    if (c < 2)
        exit(10, "Usage: %s <input_file>\n", v[0]);

    Stdio.File f = Stdio.File();

    if (!f->open(v[1], "r"))
        exit(20, "Failed to open %s (%s).\n", v[1], strerror(f->errno()));

    foreach (f->line_iterator(); int n; string line)
    {
        array(string) l = line / "";

        mapping(string:int) count = Array.count(l);

        if (has_value(count, 2))
            two_count++;

        if (has_value(count, 3))
            three_count++;
    }

    write("Checksum: %d\n", two_count * three_count);
    return 0;
}
