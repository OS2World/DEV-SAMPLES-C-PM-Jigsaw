# nmake makefile
#
# Tools used:
#  Compile::Watcom Resource Compiler
#  Compile::GNU C
#  Make: GNU make
all : jigsaw.exe jigsaw.hlp

jigsaw.exe : jigsaw.obj globals.obj jighelp.obj misc.obj procs.obj jigsaw.res jigsaw.def
	gcc -Zomf jigsaw.obj globals.obj jighelp.obj misc.obj procs.obj jigsaw.def -o jigsaw.exe
	wrc jigsaw.res

jigsaw.obj : jigsaw.c globals.h jigsaw.h jighelp.h
	gcc -Wall -Zomf -c -O2 jigsaw.c -o jigsaw.obj
	
globals.obj : globals.c globals.h jigsaw.h jighelp.h
	gcc -Wall -Zomf -c -O2 globals.c -o globals.obj

jighelp.obj : jighelp.c globals.h jigsaw.h jighelp.h
	gcc -Wall -Zomf -c -O2 jighelp.c -o jighelp.obj
	
misc.obj : misc.c globals.h jigsaw.h jighelp.h
	gcc -Wall -Zomf -c -O2 misc.c -o misc.obj
	
procs.obj : procs.c globals.h jigsaw.h jighelp.h
	gcc -Wall -Zomf -c -O2 procs.c -o procs.obj

jigsaw.res: jigsaw.rc jigsaw.h jigsaw.ico jighelp.rc jigsaw.dlg
	wrc -r jigsaw.rc jighelp.rc

jigsaw.hlp: jigsaw.ipf
	wipfc -l en_US jigsaw.ipf

clean :
	rm -rf *exe *res *obj *hlp
