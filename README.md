
# mdwa.vim

[The Most Dangerous Writing App][1], in Vim plugin form.

## But what actually is it?

If you didn't click on the link above: *'The Most Dangerous Writing App'* is a clever little
web writing app that tries to help you be productive with your writing. It has you choose a desired
session length (5, 10, 20, 30, 45 or 60 minutes) and then gives you the following ultimatum:

*If you stop typing for more than 5 seconds before the session is over, the app will erase all of
your progress, with no opportunity to recover.*

The idea, of course, is that the first step to writing well is to write at all. (Step 2 is editing
your crap afterwards, but I digress.)

I had way too much time on my hands, so I turned it into a Vim plugin.

## Usage

Loading the script provides one command:

```
MDWASTART {minutes}
```

`minutes` being the desired session length, in minutes. Once this command is run, you will see a
message alerting you that the game has started. From this point on, if you fail to make any
keystrokes for five seconds, the app will take this to mean that you are "done". If your writing
time is less than the target time, *the game will wipe your buffer, and also the file it was loaded
from.*

In other words, *DO NOT USE THIS PLUGIN ON A BUFFER LINKED TO A FILE THAT YOU CARE ABOUT*. I am
not responsible for any loss of work or data if you do so. You idiot.

## Installation

It's 2016 and we should all be using [Pathogen][2] already:

```
git clone https://github.com/Reikim/mdwa.vim ~/.vim/bundle/mdwa_vim
```

The script is very simple, though, and could be simply `source`'d from Vim's command line, or in
your vimrc somewhere.

## Next Steps

What? Of course I'm still working on it. It's a hobby.

The next step will be improving the display. For starters, it would be nice to show a clock to the
user with the amount of time remaining (like in the original app) and also some indication of how
close they are to failing.

## License

Public domain, under the [Unlicense][3]. See LICENSE for details.


[1]: https://github.com/maebert/themostdangerouswritingapp
[2]: https://github.com/tpope/vim-pathogen
[3]: http://unlicense.org/



