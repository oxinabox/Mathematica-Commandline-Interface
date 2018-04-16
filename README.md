# Mathematica Commandline Interface

Mathematica has always had a [commandline interface](http://reference.wolfram.com/language/tutorial/UsingATextBasedInterface.html).
This is good, it is alot more responsive than the notebook on low specc'ed hardware, and opens up the option of running it on a high powered server over SSH.

This set of scripts wraps that command line interface to provide readline features.



## Features


### Base Mathematica Commandline Features:
All the base features from the commandline mathematica are preserves, including:
 - Multiline "natural" equation output
 - Ability to interact with the liscensing servers in a variety of ways. (Some require a webbrowser)

### Readline Features
This program adds the following features using `rlwrap`

 - Bracket (brace) matching
 - Tabcompletion of keywords
 - When X11 is working (either via XForwarding or local X) display graphs in a window.
     - this functionality is limited and kinda slow, because it uses `JavaGraphics`
     - It can be disabled by setting the `-x` flag: `math -x`


## Installation
The majority of the functionality of this interface is from using [rlwrap](https://github.com/hanslub42/rlwrap). 
rlwrap can be installed on debain base distributions by `apt-get install rlwrap` and on many other distributions though there package-mangers.
This interface has only been tested on linux. In theory it should work on any system with rlwrap, a POSIX shell and Mathematica.

Once rlwrap in installed, clone the repo, into somewhere you would like. 
I put it into a `Wolfram/Mathematica/CommandLine/` subdirectory, but you can put it whereever.

```
git clone https://github.com/oxinabox/Mathematica-Commandline-Interface.git
```

Edit the second line of `math.sh` to have the path to the base mathematica commandline program, if required.
```
PROG="../8.0/Executables/math"
```

Optionally symlink math.sh into a directory in your path:

```
ln -s math.sh /usr/local/bin/math
```


