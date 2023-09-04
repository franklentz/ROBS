#' Gets the version of the currentplugin and rpc version
#'
#' @description
#'
#' Gets the version of the currentplugin and rpc version from OBS using an existing connection to OBS.
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
#' GetVersion(obs = myobs)
#' disconnectFromOBS(myobs)
#' }

GetVersion <- function(obs = obs,
                         requestId = uuid::UUIDgenerate(),
                         verbose = TRUE ){


  opCode6(obs = obs,
          requestType = "GetVersion",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "GetVersion",
          paste("Client requested the version"))

  return(requestId)
}
