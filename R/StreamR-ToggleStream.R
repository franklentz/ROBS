#' Toggle the status of the stream output
#'
#' @description
#'
#' Toggle the status of the stream output in OBS using an existing connection to OBS.

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
#' ToggleStream(obs = myobs)
#' disconnectFromOBS(myobs)
#'}
ToggleStream <- function(obs = obs,  requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  opCode6(obs = obs, requestType = "ToggleStream", requestId = requestId, verbose = verbose)

  logThis(obs, requestId, "0", "ToggleStream", "Client asked to toggle the stream status")

  return(requestId)
}
