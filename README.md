URL: http://codekata.pragprog.com/2007/01/kata_eight_conf.html

we’re going to write a program to solve a simple problem, and we’re going to write it with three different sub-objectives. Our program is going do process the dictionary we used in previous kata, this time looking for all six letter words which are composed of two concatenated smaller words. For example:

  al + bums => albums
  bar + ely => barely
  be + foul => befoul
  con + vex => convex
  here + by => hereby
  jig + saw => jigsaw
  tail + or => tailor
  we + aver => weaver

Write the program three times.

    The first time, make program as readable as you can make it.
    The second time, optimize the program to run fast fast as you can make it.
    The third time, write as extendible a program as you can.

Rough Timing on my PC:

bob@bob-KT965-ATXE:~/kata/eight$ time ./kataEight >& foo
real    0m10.559s
user    0m10.525s
sys 0m0.016s

bob@bob-KT965-ATXE:~/kata/eight$ time ./kataOptOne >& bar
real    0m4.020s
user    0m3.996s
sys 0m0.008s

Setup Bits I will forget:
1246  touch README.md
 1247  git init
 1248  git add README.md
 1249  git commit -m "first commit"
 1250  git config --global user.name "Bob Sullivan"
 1251  git remote add origin https://github.com/sullivanbob/kataEight.git
 1252  git push -u origin master

