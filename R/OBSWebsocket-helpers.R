# ---------------------- Helpers --------------------------



# ------------------- Create handlers ---------------------


createHandlers <- function(obs){

  obs$onOpen(function(event) {
    cat("Connection opened.\n")
  })

  obs$onMessage(function(event) {
    cat("Client got msg: ", event$data, "\n")

    # #### execute only at connection and / or authetication
    obs$obsWebSocketVersion <- fromJSON(event$data)$d$obsWebSocketVersion
    obs$challenge <- fromJSON(event$data)$d$authentication$challenge
    obs$salt <- fromJSON(event$data)$d$authentication$salt

    # Change the request status in the log if present

    if(!is.null(fromJSON(event$data)$op)){

      if(fromJSON(event$data)$op=="7"){

        # ####### some calls do not already have an
        requestId <- fromJSON(event$data)$d$requestId
        requestType <- fromJSON(event$data)$d$requestType
        code <- fromJSON(event$data)$d$requestStatus$code
        #comment <- ifelse(!is.null(fromJSON(event$data)$d$requestStatus$comment),fromJSON(event$data)$d$requestStatus$comment, NA_character_)
        comment <- ifelse(fromJSON(event$data)$d$requestStatus$code==100,
                          "OK",
                          ifelse(!is.null(fromJSON(event$data)$d$requestStatus$comment),
                                fromJSON(event$data)$d$requestStatus$comment,
                                NA_character_)
                          )
        responseData <- ifelse(!is.null(fromJSON(event$data)$d$responseData),
                               toJSON(fromJSON(event$data)$d$responseData),
                               NA_character_)

        myobs$outlog[myobs$outlog[,1]==requestId,] <- c("requestId" = requestId,
                                                        "requestStatus" = code,
                                                        "requestType" = requestType,
                                                        "requestComment" = comment,
                                                        "responseData" = responseData
                                                       )
                                      }
                                        }
    })



  obs$onClose(function(event) {
    cat("Client disconnected with code ", event$code,
        " and reason ", event$reason, "\n", sep = "")
  })

  obs$onError(function(event) {
    cat("Client failed to connect: ", event$message, "\n")
  })


}


# --------------------- logThis ----------------------------------------------


logThis <- function(obs, requestId, requestStatus = 0, requestType, requestComment = NA_character_){


  obs$outlog <- rbind(obs$outlog, data.frame("requestId" = requestId,
                                             "requestStatus" = requestStatus,
                                             "requestType" = requestType,
                                             "requestComment" = requestComment,
                                             "responseData" = NA_character_
  )
  )
}

# ---------------------
