signals.options = new.env()


get_option = function(option){
    get(option, envir=signals.options)
    }


set_option = function(option, value){
    assign(option, value, envir=signals.options)
    }
