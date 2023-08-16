#' Gets the scene "transition override" for a scene.
#'
#' @description
#'
#' Gets the scene "transition override" for a scene. from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene (must exist in obs)
#' @param transitionName Name of the scene transition to use as override. Specify null to remove
#' @param transitionDuration Duration to use for any overridden transition. Specify null to remove. >= 50, <= 20000.
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
#' GetSceneSceneTransitionOverride(obs = myobs, scene = "Muti Cam Scene" )
#' disconnectFromOBS(myobs)

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
