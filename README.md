DerelictBASS
============

*Warning: this an unofficial Derelict binding.*

A dynamic binding to [BASS](http://www.un4seen.com/) for the D Programming Language.

For information on how to build DerelictBASS and link it with your programs, please see the post [Building and Using Packages in DerelictOrg](http://dblog.aldacron.net/forum/index.php?topic=841.0) at the Derelict forums.

For information on how to load the BASS library via DerelictBASS, see the page [DerelictUtil for Users](https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users) at the DerelictUtil Wiki. In the meantime, here's some sample code.

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