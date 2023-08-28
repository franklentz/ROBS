#' Asks whether studio mode is enabled.
#'
#' @description
#'
#' Gets whether studio mode is enabled on OBS using an existing connection to OBS

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
#' GetStudioModeEnabled(obs = myobs)
#' disconnectFromOBS(myobs)
#'}

GetStudioModeEnabled <- function(obs = obs, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data

  opCode6(obs = obs,
          requestType = "GetStudioModeEnabled",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0", "GetStudioModeEnabled", "Client asked if the studio mode is enabled")

  return(requestId)
}
