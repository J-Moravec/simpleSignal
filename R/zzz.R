.onLoad = function(libname, pkgname){
    set_option("log_file", NULL)
    set_option("colorize", FALSE)
    set_option("warning_occurred", FALSE)

    packageStartupMessage("Checking if your terminal supports colors: ", appendLF=FALSE)
    if(crayon::has_color()){
        set_option("colorize", TRUE)
        packageStartupMessage(colorize("pass", "light green"))
        } else {
        packageStartupMessage("fail")
        packageStartupMessage("WARNING: Your terminal does not support colors.")
        }
    }
