# Age in days

If you enter you birthdate, this program will tell you exactly how old you are.
It was written as practice to learn Ada.
Feel free to submit issues or pullrequests if you can find ways to improve the code; it will probably teach us both new things.

# Requirements

You need an installation of GNAT; this comes bundled with AdaCore's GPS, but you can also install it standalone, for example on Ubuntu/Debian with:

```
sudo apt install build-essential gnat gcc
```

# Compile

There is a makefile included which calls gnatmake. It could just as well be done using gprbuild - I will leave that as an exercise for the reader.

# Example run:

```
tama@tardis:~/code/ada/ageindays$ ./ageindays
Today is 31/7/2020
What is your birthday?
Supported formats by example:
-24th of September 1992
-24 of September 1992
-24 September 1992
-September 24th, 1992
-September 24th 1992
-September 24, 1992
-September 24 1992
> 22nd of June 1991
Birthday: 22/6/1991
You are 29 years, 1 month and 9 days old.
Total age in days: 10632
> March 15 1993
Birthday: 15/3/1993
You are 27 years, 4 months and 16 days old.
Total age in days: 10000
>
```
