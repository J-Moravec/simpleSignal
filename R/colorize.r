#' Colorize text
#'
#' If your terminal supports colors, this will colorize your message!
#'
#' This function utilize some global variable: \code{colorize} in environment
#' \code{signals.options} which is initialized on startup with
#' \code{crayon::has_color} and will inform this
#' function if terminal does support colors, and \code{.colors} which contain
#' set of predefined colors and their codes.
#'
#' Coloring text in terminals works in following way:
#' First prefix that enable coloring: \code{\\033[}
#' Type of text (bold, italics, underlined...) and code for color, for example:
#' \code{0;34} is blue and \code{1;34} is bold blue. This coding is rather
#' specific for your terminal. This code is followed by \code{m}.
#'
#' Finally, color is reseted into default color by following code:
#' \code{\\033[0m}.
#'
#' You can use on of the predefined colors from \code{.color} variable, use
#' predefined or custom created style from \code{crayon} package or
#' provide your own color code using \code{code} argument. 
#'
#' @param text text that you want colorize
#' @param color one of colors from \code{.colors}, see \code{simpleSignal::.colors}
#' @param style \code{crayon} class object with style from \code{crayon} package
#' @param code your own color code (number for font type and color)
#'
#' @return text with tags which will colorize text if printed onto terminal
#'
#' @examples
#' simple_text = colorize("I am a simple text.", color="light blue")
#'
#' # Prints text with coloring tags:
#' print(simple_text)
#'
#' # If your terminal supports colors, prints colored text:
#' cat(simple_text, "\n")
#'
#' # You can provide your own color code and experiment
#' colorize("I am bold and blue", code="1;34")
#' colorize("I may have blue background", code="7;34")
#' colorize("Strike through blue text", code="9;34")
#'
#' @export
colorize = function(text, color="red", style=NULL, code=NULL){
    # do not colorize if set to none or terminal does not support this
    if(color=="none" || get_option("colorize")==FALSE){
        return(text)
        }

    # colorize according to style from crayon
    if(!is.null(style)){
        if(!class(style) == "crayon"){
            stop("ERROR: Must provide valid style from Crayon package")

            } else {
            return(style(text))            
            }
        }

    # colorize according to provided code or fetch the code from .colors
    if(!is.null(code)){
        col = code
        } else {
        if(!color %in% names(.colors)){
            stop(
                "Wrong color specification. Use these colors:\n",
                paste0(.colors, collapse="\n"), "\n",
                )               
            }
        col = .colors[tolower(color)]
        }

    col_escape = function(col){
        return(paste0("\033[", col, "m"))
        }

    init = col_escape(col)
    reset = col_escape("0")
    return(paste0(init, text, reset))
    }


#' @export
.colors = c(
    "black" = "0;30",
    "blue" = "0;34",
    "green" = "0;32",
    "cyan" = "0;36",
    "red" = "0;31",
    "purple" = "0;35",
    "brown" = "0;33",
    "light gray" = "0;37",
    "dark gray" = "1;30",
    "light blue" = "1;34",
    "light green" = "1;32",
    "light cyan" = "1;36",
    "light red" = "1;31",
    "light purple" = "1;35",
    "yellow" = "1;33",
    "white" = "1;37"
    )
