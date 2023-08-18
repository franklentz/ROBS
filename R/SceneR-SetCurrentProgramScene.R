#' Changes the Scene of the current program
#'
#' @description
#'
#' Changes the Scene of the current program using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene to switch to (must exist in obs)
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
#' SetCurrentProgramScene(obs = myobs, scene = "Muti Cam Scene")
#' SetCurrentProgramScene(obs = myobs, scene = "BRB")
#' disconnectFromOBS(myobs)
#' }

SetCurrentProgramScene <- function(obs = obs, sceneName = "main", requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  requestData = paste0("{
    \"sceneName\": \"", sceneName ,"\"
  }")

  opCode6(obs = obs,
          requestType = "SetCurrentProgramScene",
          requestId = requestId,
          requestData,
          verbose = verbose)

  logThis(obs, requestId, "0", "SetCurrentProgramScene", paste("Client asked to change scene to", sceneName))
}
