#!/usr/bin/pike

int find_longest(array(string) in)
{
    int cmp(string a, string b)
    {
        if (sizeof(a) > sizeof(b))
            return 1;
        return 0;
    };
    array(string) a = Array.sort_array(in, cmp);

    return sizeof(a[-1]);
}

array(string) sub_array(array(string) in, int index)
{
    array(string) res = ({ });
    foreach (in, string l)
    {
        res += ({ l[..index - 1] + l[1 + index..] });
    }
    return res;
}

int main(int c, array(string) v)
{
    int two_count = 0;
    int three_count = 0;

    if (c < 2)
        exit(10, "Usage: %s <input_file>\n", v[0]);

    Stdio.File f = Stdio.File();

    if (!f->open(v[1], "r"))
        exit(20, "Failed to open %s (%s).\n", v[1], strerror(f->errno()));

    array(string) in = (f->read() / "\n") - ({ "" });
    int longest = find_longest(in);

    for (int i = 0; i < longest; i++)
    {
        mapping(string:int) count = Array.count(sub_array(in, i));
        if (has_value(count, 2))
        {
            array(string) ind = indices(count);
            array(int) val = values(count);
            int index = search(val, 2);
            write("Solution: %s\n", ind[index]);
            break;
        }
    }

    return 0;
}
