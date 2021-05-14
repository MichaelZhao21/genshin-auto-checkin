# Genshin Auto Daily Check-in

This annoying thing -> [https://webstatic-sea.mihoyo.com/ys/event/signin-sea/index.html](https://webstatic-sea.mihoyo.com/ys/event/signin-sea/index.html)

I've found a way to automate it with the power of POST requests LOL

## Installation

idk yet lol

## Configuration

Create a file called `config` in this same directory and add the following contents:

```
[Name of account 1]
[Pasted cookies of account 1]
[Name of account 2]
[Pasted cookies of account 2]
...etc
```

The names are simply labels and can be anything. The pasted cookies line should consist of the lines that were copied from the `document.cookie` query on the hoyolab website. Here is an example (modified for obvious reasons):

```
Michael main
mi18nLang=en-us; _MHYUUID=533eedcc-2333-4223-6534-2fedaff33922; ltoken=w9UBUWubU9GBU3fdbwfewsdERw9G24929B823gh4; ltuid=66542345
```

The cookie fields should contain the following:

- mil8nLang (should be en-us)
- _MHYUUID (32 character UUID v4)
- ltoken (random string of 40 characters)
- ltuid (8 digit number)

If there are extra fields it is okay (firefox gives some others iirc)

## Execution

Use `crontab` or your system equivalent to run this simple script!

For crontab, add this line:

```
0 1 * * * ~/[path-to-this-dir]/run.bash
```

This will run the script at 1:00 AM every night!
