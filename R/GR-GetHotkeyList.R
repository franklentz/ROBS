#' Gets the hot key list
#'
#' @description
#'
#' Gets the hto key list from OBS using an existing connection to OBS.
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
#' GetHotkeyList(obs = myobs)
#' disconnectFromOBS(myobs)
#' }

GetHotkeyList <- function(obs = obs,
                       requestId = uuid::UUIDgenerate(),
                       verbose = TRUE ){


  opCode6(obs = obs,
          requestType = "GetHotkeyList",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "GetHotkeyList",
          paste("Client requested the hot key list"))

  return(requestId)
}
