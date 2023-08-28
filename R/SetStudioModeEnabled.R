#' Activate or desactivate the studio mode
#'
#' @description
#'
#' Set whether studio mode is enabled or not on OBS using an existing connection to OBS

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param studioModeEnabled TRUE (enabled) or FALSE (disabled). Default: TRUE
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
#' SetStudioModeEnabled(obs = myobs, studioModeEnabled = TRUE)
#' disconnectFromOBS(myobs)
#'}

SetStudioModeEnabled <- function(obs = obs, studioModeEnabled = TRUE, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data
  requestData = paste0("{\"studioModeEnabled\": " , tolower(studioModeEnabled) ,"}")

  opCode6(obs = obs,
          requestType = "SetStudioModeEnabled",
          requestData,
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0", "SetStudioModeEnabled", "Client changed sutio mode")

}
