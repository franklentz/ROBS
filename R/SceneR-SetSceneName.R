#' Sets the name of a scene (rename).
#'
#' @description
#'
#' Sets the name of a scene (rename) from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene to set the name (must exist in obs)
#' @param newSceneName The new name of the scene to set the name to
#' @param requestId The requestId used to provide feedback. Default UUIDgenerate()
#' @param verbose More messages and outputs if TRUE. Default: TRUE
#'
#' @author FML
#'
#' @export
#'
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' SetSceneName(obs = myobs, sceneName = "Muti Cam Scene", newSceneName = "SC MultiCam")
#' disconnectFromOBS(myobs)
#' }

SetSceneName <- function(obs = obs, sceneName, newSceneName, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  requestData = paste0("{\"sceneName\": \"", sceneName, "\", \"newSceneName\": \"", newSceneName ,"\"}")

  opCode6(obs = obs,
          requestType = "SetSceneName",
          requestId = requestId,
          requestData,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "SetSceneName",
          paste("Client asked to change the name of", sceneName, "to", newSceneName))
}
