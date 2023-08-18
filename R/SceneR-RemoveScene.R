#' Remove a Scene from OBS
#'
#' @description
#'
#' Remove a Scene from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene to remove (must exist in obs)
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
#' RemoveScene(obs = myobs, sceneName = "Muti Cam Scene")
#' RemoveScene(obs = myobs, sceneName = "BRB")
#' disconnectFromOBS(myobs)
#' }

RemoveScene <- function(obs = obs, sceneName, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  requestData = paste0("{
    \"sceneName\": \"", sceneName ,"\"
  }")

  opCode6(obs = obs,
          requestType = "RemoveScene",
          requestId = requestId,
          requestData,
          verbose = verbose)

  logThis(obs, requestId, "0", "RemoveScene", paste("Client asked to remove scene", sceneName))
}
