#' Create the R OBS Websocket object
#'
#' @description
#'
#' Use an OBSWebsocket object to create a connection to the OBS Websocket server
#' The WebSocket server (Use "Tools" menu in OBS) must be activated.
#'
#' @param obs an OBSwebsocket object
#' @author FML
#' @export
#' @examples
#' \dontrun{
#'  myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' disconnectFromOBS(myobs)
#' }

# ----------------------------------------------------------------



# ------------------ Connect to OBS ------------------------------

connectToOBS <- function(obs){
  obs$connect()
  return(obs)
}
