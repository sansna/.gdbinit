# ~/.gdbinit: gdb startup configure file.
# use -x this_file when gdb.
# Or cp gdbcfg ~/.gdbinit to
# let gdb open this file as default setting.
# to disable default loading, use -n|--nx when gdb.

set listsize 10
set print array on
set print array-indexes on
set print pretty on
set print union on
set print demangle on
set multiple-symbols ask
# Stop everytime when shared lib loads.
#set stop-on-solib-events 1
# Inferiors mean different processes being debugged in gdb.
set print inferior-events on
set step-mode on
# Set Breakpoints even when breakpoint symbol not found in current scope.
set breakpoint pending on
# To set breakpoints at thread fork. Use info func pthread_create, and b the
#+ functions which as numbers with them but no '@'

# Here are some defines for cpp-stl:
#+ from http://www.yolinux.com/TUTORIALS/src/dbinit_stl_views-1.01.txt
#set print object on
#set print static-members on
#set print vtbl on
#set demangle-style gnu-v3
#set print sevenbit-strings off

# Observer mode, default off, if set to on, it enables non-stop debugging
#set observer on
# Non-stop mode start: `show non-stop` to view mode. Note to set this mode
#+ on before start/connects debugging, change mode during debugging is
#+ generally not supported.
#set pagination off
#set non-stop on
# Non-stop mode end

# instructions when using gdb:
# c-x,s enters tui mode.
# c/n/f/s/u/d/v/w in tui mode.
# c-x,c-a to exit tui mode.
# p/t var to print var as ntw,
# where t = c/i/x/..
# x/ntw where n=int, t=type, w=width to view memory.

# User-defined Commands
define pp
    p *$arg0
end

define psi
    p sizeof(struct $arg0)
end
# End of UDC

define p0
    p $arg0[0]
end

define p1
    p $arg0[1]
end

define p2
    p $arg0[2]
end

define p3
    p $arg0[3]
end

define px
    p/x *$arg0
end

define po
    p/o *$arg0
end

define pt
    p/t *$arg0
end

define ps
    p/s $arg0
end

define pas
    p ((struct $arg0)$arg1)
end

# Aliases, Pattern: alias [-a] [--] shortcuts = normal commands


# End of aliases.

# Sources from others' contributions..
# From mammon/gdb_init
define bp
    info breakpoints
end
document bp
Print breakpoints
end

define bd
    del break $arg0
end

define bn
    enable br $arg0
end
document bn
Enable breakpoints
end

define bf
    disable br $arg0
end
document bf
Disable breakpoints
end

define hw
	set can-use-hw-watchpoints 1
end
document hw
Switch to use hardware watchpoints, which is faster.
end

define sw
	set can-use-hw-watchpoints 0
end
document sw
Set to use software watchpoints, thus no size/count limit on watched vars.
And also, software watchpoints can only watch current thread noticeable vars.
end

define cw
	show can-use-hw-watchpoints
end
document sw
Show if currently using hw-watchpoints
end
# End
