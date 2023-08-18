#' Gets the scene "transition override" for a scene.
#'
#' @description
#'
#' Gets the scene "transition override" for a scene. from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene (must exist in obs)
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
#' GetSceneSceneTransitionOverride(obs = myobs, scene = "Muti Cam Scene" )
#' disconnectFromOBS(myobs)
#' }

GetSceneSceneTransitionOverride <- function(obs = obs,
                                            sceneName,
                                            requestId = uuid::UUIDgenerate(),
                                            verbose = TRUE ){

  requestData = paste0("{\"sceneName\": \"",
                       sceneName,
                       "\"}")

  opCode6(obs = obs,
          requestType = "GetSceneSceneTransitionOverride",
          requestId = requestId,
          requestData,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "GetSceneSceneTransitionOverride",
          paste("Client requested the transition override parameters of", sceneName))
}
