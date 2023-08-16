#' Changes the Scene of the current preview
#'
#' @description
#'
#' Changes the Scene of the current preview using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene to switch to (must exist in obs)
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
#' SetCurrentPreviewScene(obs = myobs, sceneName = "Muti Cam Scene")
#' SetCurrentPreviewScene(obs = myobs, sceneName = "BRB")
#' disconnectFromOBS(myobs)

SetCurrentPreviewScene <- function(obs = obs, sceneName = "main", requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  requestData = paste0("{
    \"sceneName\": \"", sceneName ,"\"
  }")

  opCode6(obs = obs,
          requestType = "SetCurrentPreviewScene",
          requestId = requestId,
          requestData,
          verbose = verbose)

  logThis(obs, requestId, "0", "SetCurrentPreviewScene", paste("Client asked to change preview scene to", sceneName))
}
