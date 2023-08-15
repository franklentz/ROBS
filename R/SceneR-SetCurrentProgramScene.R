#' Changes the Scene of the current program
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
#' disconnectFromOBS(myobs)

SetCurrentProgramScene <- function(obs = obs, scene = "main", requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  requestData = paste0("{
    \"sceneName\": \"", scene ,"\"
  }")

  opCode6(obs = obs,
          requestType = "SetCurrentProgramScene",
          requestId = requestId,
          requestData,
          verbose = verbose)
}
