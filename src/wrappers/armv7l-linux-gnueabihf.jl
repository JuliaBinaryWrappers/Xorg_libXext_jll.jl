# Autogenerated wrapper script for Xorg_libXext_jll for armv7l-linux-gnueabihf
export libXext

using Xorg_libX11_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libXext`
const libXext_splitpath = ["lib", "libXext.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libXext_path = ""

# libXext-specific global declaration
# This will be filled out by __init__()
libXext_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libXext = "libXext.so.6"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Xorg_libXext")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Xorg_libX11_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Xorg_libX11_jll.LIBPATH_list,))

    global libXext_path = normpath(joinpath(artifact_dir, libXext_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libXext_handle = dlopen(libXext_path)
    push!(LIBPATH_list, dirname(libXext_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

