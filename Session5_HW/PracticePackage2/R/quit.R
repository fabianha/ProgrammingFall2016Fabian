quit <-
function (save = "default", status = 0, runLast = TRUE) 
{
    save = switch(save, default = , yes = TRUE, no = FALSE, ask = ask("Save workspace image? [y/n/c]: "), 
        stop("unknown `save` value"))
    if (is.null(save)) 
        return()
    if (runLast) {
        if (!is.null(.GlobalEnv$.Last)) 
            .GlobalEnv$.Last()
        if (!is.null(.GlobalEnv$.Last.sys)) 
            .GlobalEnv$.Last.sys()
    }
    if (save) 
        NULL
    payload <<- c(payload, list(list(source = "ask_exit")))
}
