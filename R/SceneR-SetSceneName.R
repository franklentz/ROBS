#' Sets the name of a scene (rename).
#'
#' @description
#'
#' Sets the name of a scene (rename) from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene to set the name (must exist in obs)
#' @param newSceneName The new name of the scene to set the name to
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
#' SetSceneName(obs = myobs, scene = "Muti Cam Scene")
#' SetSceneName(obs = myobs, scene = "BRB")
#' disconnectFromOBS(myobs)

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
