# Basic-C-Template
👨🏽‍🍳 Basic project template for general C projects. Made for the 42 curriculum and with ❤️

## Quick Start 
```
$ git clone --recursive git@github.com:RubenNijhuis/Basic-C-Template.git
$ make run
```

Et voila, a main.c outputting a welcome message

Some of the next steps could be changing the name of the project. Which you can do in the `General Variables` section of the Makefile.

## Notes

#### Submodules:
This project uses my personal libraries, in case you want to use your own I recommend learning some stuff about git submodules [here](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

However the `Makefile` specifically supports my project/library structure. This WILL be an issue if your library structure differs. Mine works like this.

1. A library has two major components.
    1. There is an include folder where the `.h` files can be found.
    2. The `.a` file must be in the root of the directory
2. The makefile is in the root of the project

In short the structure should match something like this.
```
| root
|   include/
|       .h files
|   Makefile
|   archive.a
```

But don't worry. Anyone with a basic understanding of Makefiles should be able to change the paths that are in the `input files` section of the makefile.

#### Just a casual coder
My expertise lies with Web Development so my use of the makefile might be a bit crude as to what the standards are. My apologies for this but I felt like providing a source like this will help anyone who still has issues with structuring their project. A small bits help right?

#### Opnionated:
This project is structure in a way that I prefer working with. It's a mix of working in JavaScript projects and some other languages where folder structure dictates code relation. If you have improvements or other comments you can open an issue.

#### Program creation
Due to the way the makefile is made you have to explicitely name each file in your makefile. (this will change in an update soon btw). Furthermore `.o` files are put in a `objs/` folder to keep the `src/` clean.

## Structure
```
/- Basic-C-Template
    /- assets
        # Any assets like images or text files can be put here
    /- include
        # files like .a or .h can be put here
    /- libs
        # included libraries like libft or get_next_line are put here
    /- src
        # your project files can be ordered here
    .gitignore # i really shouldn't have to explain this
    LICENS # mit licens for license reasons
    Makefile # magic happens here
    README.md # the file that contains what you are currently reading
```

## Used by projects like
Pipex - https://github.com/RubenNijhuis/Pipex <br>
Philosophers - https://github.com/RubenNijhuis/Philosophers <br>
So Long - https://github.com/RubenNijhuis/So-Long <br>
Push Swap - https://github.com/RubenNijhuis/Push-Swap <br>
MiniShell - https://github.com/mjoosten42/minishell
