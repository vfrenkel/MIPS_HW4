			      CSEE W3827
		   Fundamentals of Computer Systems
			Homework Assignment 4

		       Prof. Stephen A. Edwards
			 Columbia University

		 Due November 17th, 2011 at 11:59 PM

You will be writing MIPS assembly code for this assignment.

You will need a development environment: either download and install
SPIM from http://spimsimulator.sourceforge.net/ or use the cunix
machines (cunix.cc.columbia.edu).  I suggest the QtSpim release, which
has a nice graphical interface and is available for Windows, Mac, and
Linux.

Lots of documentation on SPIM is available on the web.  One of my
favorites is the appendix from Computer Organization and Design,
available on

http://spimsimulator.sourceforge.net/further.html

Next, make sure you can run SPIM on a program.  I've provided
"hello.s," the canonical Hello World program coded in MIPS assembly,
as part of this archive.

To run it, start SPIM, select File->Reinitialize and Load File, select
"hello.s," and click on the Run/Continue button (green triangle) to
execute the program.  This should print "Hello World!" on the console
(you may have to open the console window explicitly).

It is even easier from the command line:

$ spim -file hello.s
SPIM Version 8.0 of January 8, 2010
Copyright 1990-2010, James R. Larus.
All Rights Reserved.
See the file README for a full copyright notice.
Loaded: /usr/lib/spim/exceptions.s
Hello World!
$

##############################
The assignment:

1. Write a MIPS assembly program that takes two signed integer
   arguments and returns the one whose absolute value is larger.

   Follow the instructions in absmin.s

2. Write a MIPS assembly program that can draw horizontal lines in a
   simple framebuffer.

   Follow the instructions in horiz.s

3. Write a MIPS assembly program that can draw arbitrary lines in a
   simple framebuffer.

   Follow the instructions in star.s

##############################
To turn in this homework:

1. Rename this directory to your UNI instead of "hw4," e.g.,

   $ mv hw4 se2007

2. Create a tarball of your directory, e.g.,

   $ tar zcf se2007.tar.gz se2007

3. Upload it to the "Dropbox" in the Class Files section of
   Courseworks (courseworks.columbia.edu) for 3827.
