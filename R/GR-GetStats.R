#' Gets statistics about OBS, obs-websocket, and the current session
#'
#' @description
#'
#' Gets statistics about OBS, obs-websocket, and the current session from OBS using an existing connection to OBS.
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
#' GetStats(obs = myobs)
#' disconnectFromOBS(myobs)
#' }

GetStats <- function(obs = obs,
                       requestId = uuid::UUIDgenerate(),
                       verbose = TRUE ){


  opCode6(obs = obs,
          requestType = "GetStats",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "GetStats",
          paste("Client requested the stats"))

  return(requestId)
}
