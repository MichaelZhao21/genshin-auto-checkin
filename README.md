# Genshin Auto Daily Check-in

This annoying thing -> [https://webstatic-sea.mihoyo.com/ys/event/signin-sea/index.html](https://webstatic-sea.mihoyo.com/ys/event/signin-sea/index.html)

I've found a way to automate it with the power of POST requests LOL

## Installation

Just clone the repo!

## Getting the Cookies

For this app to work, you will need to retrieve your login tokens from hoyolab. That is how mihoyo authenticates your account for the POST request.

First go to [https://hoyolab.com/genshin](https://hoyolab.com/genshin) and login (click on the top right icon to sign in). Make sure you log in with your Genshin account details so you can recieve the rewards in-game.

Next, go to the [daily check in page](https://webstatic-sea.mihoyo.com/ys/event/signin-sea/index.html). This page will load more cookies!

Once on the check-in page, go to the developer menu through:
- ctrl + shift + i
- F12
- Right click > Inspect

This will open the dev menu. On the top of the menu, go to the "Console" tab. Navigate to where you can enter a command into the console and type the following:

```
document.cookie
```

Press enter and you should see a bunch of information that is spit out. This should start with `"mi18nLang=` or at least contain that string somewhere. This is the cookie that you will need for every account you want to automate this task for. Save it for the configuration file.

**WARNING: DO NOT SHARE THIS COOKIE STRING!!!** Although it can only be used to access your web client, it still is not wise to share something that can only be accessed after you log in.

**ALSO NOTE: If you change your password, the token string WILL CHANGE AS WELL, so you will need to get a new cookie string for the script!**

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
0 1 * * * ~/[path-to-this-dir]/run.sh
```

This will run the script at 1:00 AM every night! Check the [crontab documentation]() for more information on how to customaize this. Remember that the check-in will reset at midnight every night and you can only check in once per day.

Finally, make sure that the `run.sh` file is executable!!! This can be achieved through the `chmod` command:

```bash
chmod +x run.sh
```
