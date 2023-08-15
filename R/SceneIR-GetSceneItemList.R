#' ask for a list of the items
#'
#' @description
#'
#' Changes the Scene of the current program using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param scene The name of the scene to switch to (must exist in obs)
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
#' GetSceneItemList(obs = myobs, scene = "BRB")
#' disconnectFromOBS(myobs)
GetSceneItemList <- function(obs = obs, scene = "main", verbose = TRUE, requestId = uuid::UUIDgenerate() ){

  requestData = paste0("{
    \"sceneName\": \"", scene ,"\"
  }")
  verbose = verbose
  opCode6(obs = obs, requestType = "GetSceneItemList", requestId = requestId, requestData, verbose)

  logThis(obs, requestId, "0", "GetSceneItemList", paste("Client asked to get the Items of", scene))

}

