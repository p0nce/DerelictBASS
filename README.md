DerelictBASS
============

*Warning: this an unofficial Derelict binding.*

A dynamic binding to [BASS](http://www.un4seen.com/) for the D Programming Language.

Please see the pages [Building and Linking Derelict](http://derelictorg.github.io/compiling.html) and [Using Derelict](http://derelictorg.github.io/using.html), or information on how to build DerelictBASS and load the BASS library at run time. In the meantime, here's some sample code.

```D
import derelict.bass.bass;

void main() {
    // Load the BASS library.
    DerelictBASS.load();

    // Now BASS functions can be called.
    ...
}
```

Thanks
======
Based on prior work from h3r3tic and !!M.
