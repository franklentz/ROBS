#' Open the input properties dialog box
#'
#' @description
#'
#' Open the input properties dialog box using an existing connection to OBS
#' (Audio Capture, Video Capture ...)

#'
#' @param obs An obs websocket with an active connection. Default obs
#' @param inputName Name of the input to open the dialog of
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
#' OpenInputPropertiesDialog(obs = myobs, inputName = "Audio Capture 1")
#' disconnectFromOBS(myobs)
#'}

OpenInputPropertiesDialog <- function(obs = obs, inputName, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data
  requestData = paste0("{\"inputName\": \"" , inputName ,"\"}")

  opCode6(obs = obs,
          requestType = "OpenInputPropertiesDialog",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId,
          "0",
          "OpenInputPropertiesDialog",
          paste("Client requested to open the input properties Dialog box of", inputName)
  )

  return(requestId)
}
