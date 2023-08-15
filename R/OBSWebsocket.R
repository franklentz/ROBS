#' Create an OBS Websocket Client
#'
#' @description
#'
#' Create a websocket client to connect to OBS and send commands.
#' The WebSocket server (Use "Tools" menu in OBS) must be activated.
#'
#' @param param1 The title of the course.
#' @param param2 The main topic corresponding to the current document.
#' @param param3 The details or the summary of the topic. Default NULL.

#' @author FML
#'
#' @return A formatted outline of the course
#' @export
#'
#' @examples
#'
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' disconnectFromOBS(myobs)

# ----------------------------------------------------------------

# Doc : https://github.com/obsproject/obs-websocket/blob/release/5.2.3/docs/generated/protocol.md

# --------------------------


OBSWebSocket <- R6::R6Class(
  "OBSWebSocket",
  inherit = WebSocket,
  lock_class = TRUE,
  public = list(
    obsWebSocketVersion = "Unknown",
    challenge = NULL,
    salt = NULL,
    outlog = data.frame("requestID" = NULL,
                         "requestStatus" = NULL,
                         "requestType" = NULL,
                         "requestComment" = NULL,
                         "responseData" = NULL)
  ),
  private = list(

  )
)


# ----------------------- createOBSWebsocket -----------------------------

createOBSWebsocket <- function(address = "ws://127.0.0.1", port =4455){

  # Create the address adding ws:// if requiered

  if(substr(address,1,5)!="ws://"){
    address <-  paste0("ws://", address)
  }

  address <- paste0(address, ":", port)
  message(address)

  # WebSocket$unlock() # remove this ?
  obs <- OBSWebSocket$new(address, autoConnect = FALSE)
  createHandlers(obs)

  return(obs)

}


# ------------------ Connect to OBS ------------------------------

connectToOBS <- function(obs){
  obs$connect()
  return(obs)
}


# ------------------ Identify to OBS ------------------------------

identifyToOBS <- function(obs=obs, password, eventSub="22"){
  if(is.null(obs$challenge)){

    # ---- Authentication not activated ----

    strMessage <-  paste0("{
      \"op\": 1,
      \"d\": {
        \"rpcVersion\": 1,
        \"eventSubscriptions\": ", eventSub ,
      "}
    }"
    )

    obs$send(strMessage)

  }else{

    # ---- Authentication activated ----

    # Check if password has been provided

    if(missing(password)){
      stop("Authentication is required by the OBS WebSocket Server, please run again this function providing the password.")
    }

    # https://github.com/obsproject/obs-websocket/blob/release/5.2.3/docs/generated/protocol.md#creating-an-authentication-string

    # Concatenate the websocket password with the salt

    passwordAndSalt <- paste0(password, obs$salt)

    # Generate an SHA256 binary hash of the result and base64 encode it, known as a base64 secret.

    base64Secret <- sha256(charToRaw(passwordAndSalt))
    base64Secret <- base64_encode(base64Secret)

    # Concatenate the base64 secret with the challenge sent by the server (base64_secret + challenge)

    base64SecretAndChallenge <- paste0(base64Secret, obs$challenge)

    # Generate a binary SHA256 hash of that result and base64 encode it.

    authenticationString <- base64_encode(sha256(charToRaw(base64SecretAndChallenge)))


    # Create Message

    strMessage <-  paste0("{
      \"op\": 1,
      \"d\": {
        \"rpcVersion\": 1,
        \"authentication\": \"", authenticationString , "\", \"eventSubscriptions\": ", eventSub ,
      " }",
      " }"
    )

    # Send Message

    obs$send(strMessage)

  }
}

# ------------ disconnectFromOBS --------------------------

disconnectFromOBS <- function(obs = obs){

  obs$close()

}


