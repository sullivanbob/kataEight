// kata Eight
// Bob Sullivan
// BobSullivan63@gmail.com
// License: MIT : http://opensource.org/licenses/MIT
// 
// Optimization of the first example.
// Easy speed ups:
// 1) No single letter words.  Example does not use them.
// 2) No words in dictionary longer than 6 words.
//    No match for them anyway.
//
// Examples URLs:
// http://www.informit.com/articles/article.aspx?p=1381876&seqNum=4
// http://www.dprogramming.com/FileTutorial.html
// http://stackoverflow.com/questions/10309993/read-a-file-into-an-array-of-lines-in-d

import std.stdio, std.string, std.regex;
import std.array;

void main() 
{
    uint[string] dic;
    string[uint] dic2;
    uint cnt = 0;
    uint idx = 0;
    uint loop = 0;

    File myFile;
    myFile.open("word.lst", "rt");

    foreach (line; myFile.byLine()) 
    {
        // one word per line
        char[] word = strip(line);
        word = toLower(word);

        // Skip Possessives like am's
        if (-1 != indexOf(word, "'s"))
        {
            continue;
        }

        // If word length wrong or in dictionary
        // continue
        int len = word.length;
        if ((len < 2) || (len > 6) || (word in dic))
        {
            continue; // nothing to do
        }

        uint newID = dic.length;
        dic[word.idup] = newID;
        dic2[cnt] = word.idup;

        // writeln(dic[word], '\t', word);
        cnt++;
    }
    myFile.close();

    for (idx = 0; idx < cnt; idx++)
    {
        int llen = dic2[idx].length;
        if ((llen >= 2) && (llen <= 4))
        {
            for (loop = 0; loop < cnt; loop++)
            {
                int rlen = dic2[loop].length;
                
                if ((loop != idx) && (llen + rlen == 6))
                {
                    string result = dic2[idx] ~ dic2[loop];
                    int index = dic.get(result, 0);
                    if (0 != index)
                    {
                        writefln("%10d FOUND %s + %s -> %s", 
                                 index, dic2[idx], dic2[loop], result);
                    }
                }
            }
        }
    }
}


