#' Sends CEA-608 caption text over the stream output
#'
#' @description
#'
#' Sends CEA-608 caption text over the stream output using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param captionText The text of the caption
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
#' SendStreamCaption(obs = myobs, captionText="My caption")
#' disconnectFromOBS(myobs)
#' }

SendStreamCaption <- function(obs = obs, captionText = "Test Caption", requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  requestData = paste0("{\"captionText\": \"", captionText, "\"}")

  opCode6(obs = obs,
          requestType = "SendStreamCaption",
          requestId = requestId,
          requestData,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "SendStreamCaption",
          paste("Client asked to send a stream caption:", captionText))
}
