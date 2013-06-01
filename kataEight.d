
// http://www.informit.com/articles/article.aspx?p=1381876&seqNum=4
// http://www.dprogramming.com/FileTutorial.html

import std.stdio, std.string, std.regex;
import std.array;

void main() {
    uint[string] dic;
    string[uint] dic2;
    uint cnt = 0;
    uint idx = 0;
    uint loop = 0;

    File myFile;
    myFile.open("word.lst", "rt");

    foreach (line; myFile.byLine()) {
        // Break sentence into words
        char[][] words = splitLines(strip(line));
        // Add each word in the sentence to the vocabulary
        foreach (word; words) {
            word = toLower(word);
            // 8       aids's
            // 9       am's
            ptrdiff_t pos = indexOf(word, "'s");
    
            // Skip Possessives
            if (pos != -1)
            {
                continue;
            }

            if (word in dic) continue; // nothing to do
            uint newID = dic.length;
            dic[word.idup] = newID;
            dic2[cnt] = word.idup;

//            writeln(dic[word], '\t', word);
            cnt++;
        }
    }

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
    myFile.close();
}

// http://stackoverflow.com/questions/10309993/read-a-file-into-an-array-of-lines-in-d

