#' ask for a list of the items
#'
#' @description
#'
#' Changes the Scene of the current program using an existing connection to OBS.

#'
#' @param obs An obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene to switch to (must exist in obs)
#' @param verbose More messages and outputs if TRUE. Default: TRUE
#' @param requestId The requestId used to provide feedback. Default UUIDgenerate()

#' @author FML
#'
#' @export
#'
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' GetSceneItemList(obs = myobs, sceneName = "BRB")
#' disconnectFromOBS(myobs)
#' }
GetSceneItemList <- function(obs = obs, sceneName = "main", verbose = TRUE, requestId = uuid::UUIDgenerate() ){

  requestData = paste0("{
    \"sceneName\": \"", sceneName ,"\"
  }")
  verbose = verbose
  opCode6(obs = obs, requestType = "GetSceneItemList", requestId = requestId, requestData, verbose)

  logThis(obs, requestId, "0", "GetSceneItemList", paste("Client asked to get the Items of", sceneName))
  return(requestId)
}

