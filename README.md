Obj-C-Tools
===========

This is a repo of useful scripts I write during development to make life easier

## InterfaceToImplementation.pl
This is a perl script that will take all of the methods in yur header/interface file and output the methods with braces for your implementation. This strips out all of the documentation, comments, and whatever else you have in there. To use, just start up the script in your terminal with `perl InterfaceToImplementation.pl`, then paste the contents of your .h file in the terminal. Type `done` and copy the output from the terminal and paste in your implementation file. 

**TODO**
  *Automatically copy to clipboard
  *Better way to indicate you're done rather than typing done
