#' Create the R OBS Websocket object
#'
#' @description
#'
#' Use an OBSWebsocket object already connected with connectToOBS() to the OBS Websocket server to identify the client
#' If authentication is on the OBS websocket server is activated, the password must provided
#' The WebSocket server (Use "Tools" menu in OBS) must be activated.
#'
#' @param obs an OBSwebsocket object
#' @param password the password of the OBS websocket server if authentication has been activated (strongly advisable)
#' @param eventSub Default 33
#' @author FML
#' @export
#' @examples
#'
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' disconnectFromOBS(myobs)

# ------------------ Identify to OBS ------------------------------

identifyToOBS <- function(obs=obs, password, eventSub="33"){
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

    # Concatenate the base64 secret with the challenge sent by the server (base64Secret + challenge)

    base64SecretAndChallenge <- paste0(base64Secret, obs$challenge)

    # Generate a binary SHA256 hash of that result and base64 encode it.

    authenticationString <- jsonlite::base64_encode(sha256(charToRaw(base64SecretAndChallenge)))


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
