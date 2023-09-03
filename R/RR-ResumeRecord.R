#' Resume the record of the stream output
#'
#' @description
#'
#' Resume the record of the stream output in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param requestId The requestId used to provide feedback. Default UUIDgenerate()
#' @param verbose More messages and outputs if TRUE. Default: TRUE

#' @author FML
#'
#' @export
#'
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' ResumeRecord(obs = myobs)
#' disconnectFromOBS(myobs)
#'}
ResumeRecord <- function(obs = obs,  requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  opCode6(obs = obs, requestType = "ResumeRecord", requestId = requestId, verbose = verbose)

  logThis(obs, requestId, "0", "ResumeRecord", "Client asked to resume the recording")

  return(requestId)
}
