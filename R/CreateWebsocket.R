#' Create the R OBS Websocket object
#'
#' @description
#'
#' Create a websocket object to connect to OBS and send commands.
#' The WebSocket server (Use "Tools" menu in OBS) must be activated.
#'
#' @param address Address to connect to the OBS websocket server (ws:// will be added if not provided) Default :127.0.0.1
#' @param port Port used for the connection. Default 4455
#' @author FML
#' @export
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' disconnectFromOBS(myobs)
#' }

# ----------------------------------------------------------------

# Doc : https://github.com/obsproject/obs-websocket/blob/release/5.2.3/docs/generated/protocol.md

# --------------------------


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
