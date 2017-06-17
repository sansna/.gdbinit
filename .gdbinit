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
set stop-on-solib-events 1

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
# End
