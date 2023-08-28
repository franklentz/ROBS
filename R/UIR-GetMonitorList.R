#' Ask for the monitor List
#'
#' @description
#'
#' Gets the monitor list using an existing connection to OBS

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
#' GetMonitorList(obs = myobs)
#' disconnectFromOBS(myobs)
#'}

GetMonitorList <- function(obs = obs, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data

  opCode6(obs = obs,
          requestType = "GetMonitorList",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0", "GetMonitorList", "Client requested the monitor list")

  return(requestId)
}
