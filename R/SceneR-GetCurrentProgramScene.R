#' Asks for the name of the current program scene
#'
#' @description
#'
#' Get the name of the current program scene using an existing connection to OBS

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param requestId The requestId used to provide feedback. Default UUIDgenerate()
#' @param verbose More messages and outputs if TRUE. Default: TRUE

#' @author FML
#'
#' @export
#'
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' GetCurrentProgramScene(obs = myobs)
#' disconnectFromOBS(myobs)
#' }
GetCurrentProgramScene <- function(obs = obs,  requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  opCode6(obs = obs, requestType = "GetCurrentProgramScene", requestId = requestId, verbose = verbose)

  logThis(obs, requestId, "0", "GetCurrentProgramScene", "Client asked to get the scene name of the current program")

}
