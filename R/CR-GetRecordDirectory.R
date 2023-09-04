#' Gets the record directory
#'
#' @description
#'
#' Gets the record directory from OBS using an existing connection to OBS.
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
#' GetRecordDirectory(obs = myobs)
#' disconnectFromOBS(myobs)
#' }

GetRecordDirectory <- function(obs = obs,
                       requestId = uuid::UUIDgenerate(),
                       verbose = TRUE ){


  opCode6(obs = obs,
          requestType = "GetRecordDirectory",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "GetRecordDirectory",
          paste("Client requested the version"))

  return(requestId)
}
