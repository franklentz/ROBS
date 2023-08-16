#' Asks for the name of the current preview scene
#'
#' @description
#'
#' Get the name of the current preview scene using an existing connection to OBS

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param requestID The requestID used to provide feedback. Default UUIDgenerate()

#' @author FML
#'
#' @export
#'
#' @examples
#'
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' GetCurrentPreviewScene(obs = myobs)
#' disconnectFromOBS(myobs)
#'
GetCurrentPreviewScene <- function(obs = obs,  requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  opCode6(obs = obs, requestType = "GetCurrentPreviewScene", requestId = requestId, verbose = verbose)

  logThis(obs, requestId, "0", "GetCurrentPreviewScene", "Client asked to get the scene name of the current program")

}
