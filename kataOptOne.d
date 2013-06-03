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
// 3) No need to split of lines read into words.
//    Cut and paste problem from example.
// 4) Skip too small check.  Base result on #1.
//
// Examples URLs:
// http://www.informit.com/articles/article.aspx?p=1381876&seqNum=4
// http://www.dprogramming.com/FileTutorial.html
// http://stackoverflow.com/questions/10309993/read-a-file-into-an-array-of-lines-in-d

import std.stdio, std.string, std.array;

void main() 
{
    uint[string] dic;
    string[uint] dic2;
    string str;
    string strIn;
    uint cnt = 0;

    File myFile;
    myFile.open("word.lst", "rt");

    foreach (line; myFile.byLine()) 
    {
        // one word per line
        char[] word = strip(line);
        // force lower case for matching
        word = toLower(word);

        // Skip Possessives like achilles's
        if (-1 != indexOf(word, "'s"))
        {
            continue;
        }

        // If word length wrong or in dictionary
        // continue
        int len = word.length;
        if ((len < 2) || (len > 6) || (word in dic))
        {
            // Skip these conditions
            continue;
        }

        // Index based on side of dictionary
        cnt = dic.length;
        dic[word.idup] = cnt;
        // Must create duplicate for storage
        dic2[cnt] = word.idup;
    }
    myFile.close();

    foreach(str; dic2) 
    {
        int llen = str.length;
        if (llen <= 4)
        {
            foreach(strIn; dic2) 
            {
                if ((strIn != str) && ((llen + strIn.length) == 6))
                {
                    string result = str ~ strIn;
                    int index = dic.get(result, 0);
                    if (0 != index)
                    {
                        writefln("%10d FOUND %s + %s -> %s", 
                                 index, str, strIn, result);
                    }
                }
            }
        }
    }
}

