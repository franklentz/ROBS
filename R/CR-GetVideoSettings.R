#' Gets the video settings
#'
#' @description
#'
#' Gets the video settings from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
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
#' GetVideoSettings(obs = myobs)
#' disconnectFromOBS(myobs)
#' }

GetVideoSettings <- function(obs = obs,
                       requestId = uuid::UUIDgenerate(),
                       verbose = TRUE ){


  opCode6(obs = obs,
          requestType = "GetVideoSettings",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "GetVideoSettings",
          paste("Client requested the video settings"))

  return(requestId)
}
