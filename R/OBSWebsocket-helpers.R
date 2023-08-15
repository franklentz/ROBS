# ---------------------- Helpers --------------------------



# ------------------- Create handlers ---------------------


createHandlers <- function(obs){

  obs$onOpen(function(event) {
    cat("Connection opened.\n")
  })

  obs$onMessage(function(event) {
    cat("Client got msg: ", event$data, "\n")

    obs$obsWebSocketVersion <- fromJSON(event$data)$d$obsWebSocketVersion
    obs$challenge <- fromJSON(event$data)$d$authentication$challenge
    obs$salt <- fromJSON(event$data)$d$authentication$salt

  })

  obs$onClose(function(event) {
    cat("Client disconnected with code ", event$code,
        " and reason ", event$reason, "\n", sep = "")
  })

  obs$onError(function(event) {
    cat("Client failed to connect: ", event$message, "\n")
  })


}


# -------------------------------------------------------------------------
