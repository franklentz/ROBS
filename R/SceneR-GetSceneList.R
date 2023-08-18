#' ask for a list of the scenes
#'
#' @description
#'
#' Get the list of the scenes in OBS using an existing connection to OBS.

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
#' GetSceneList(obs = myobs)
#' disconnectFromOBS(myobs)
#'}
GetSceneList <- function(obs = obs,  requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  opCode6(obs = obs, requestType = "GetSceneList", requestId = requestId, verbose = verbose)

  logThis(obs, requestId, "0", "GetSceneList", "Client asked to get the scene list")

}
