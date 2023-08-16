#' Create the R OBS Websocket object
#'
#' @description
#'
#' disconnect from the OBS websocket server
#'
#' @param obs an OBSwebsocket object
#' @author FML
#' @export
#' @examples
#'
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' disconnectFromOBS(myobs)

# ----------------------------------------------------------------



# ------------ disconnectFromOBS --------------------------

disconnectFromOBS <- function(obs = obs){

  obs$close()

}

