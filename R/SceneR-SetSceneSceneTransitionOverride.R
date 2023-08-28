#' Sets the scene "transition override" for a scene.
#'
#' @description
#'
#' Sets the scene "transition override" for a scene from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene (must exist in obs)
#' @param transitionName Name of the scene transition to use as override. Specify null to remove
#' @param transitionDuration Duration to use for any overridden transition. Specify null to remove. A number >= 50, <= 20000.
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
#' SetSceneSceneTransitionOverride(obs = myobs,
#'                                 sceneName = "Muti Cam Scene",
#'                                 transitionName = "a name",
#'                                 transitionDuration = 500)
#' disconnectFromOBS(myobs)
#' }

SetSceneSceneTransitionOverride <- function(obs = obs,
                                            sceneName,
                                            transitionName,
                                            transitionDuration = 300,
                                            requestId = uuid::UUIDgenerate(),
                                            verbose = TRUE ){
  if(transitionDuration < 50 | transitionDuration > 20000) stop("transitionDuration must be >= 50 and <= 20000")

  requestData = paste0("{\"sceneName\": \"",
                       sceneName,
                       "\", \"transitionName\": \"",
                       transitionName,
                       "\", \"transitionDuration\": ",
                       transitionDuration,
                       "}")

  opCode6(obs = obs,
          requestType = "SetSceneSceneTransitionOverride",
          requestId = requestId,
          requestData,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "SetSceneSceneTransitionOverride",
          paste("Client asked to change the transition of", sceneName, "to", transitionName, "with aduration of", transitionDuration))
}
