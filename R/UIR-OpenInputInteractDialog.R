#' Open the input interact Dialog box
#'
#' @description
#'
#' Open the input interact dialog box using an existing connection to OBS
#' (Use with browser ...)

#'
#' @param obs An obs websocket with an active connection. Default obs
#' @param inputName Name of the input to open the filters dialog of
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
#' OpenInputInteractDialog(obs = myobs, inputName = "Audio Capture 1")
#' disconnectFromOBS(myobs)
#'}

OpenInputInteractDialog <- function(obs = obs, inputName, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data
  requestData = paste0("{\"inputName\": \"" , inputName ,"\"}")

  opCode6(obs = obs,
          requestType = "OpenInputInteractDialog",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId,
          "0",
          "OpenInputInteractDialog",
          paste("Client requested to open the the interact  Dialog box of", inputName)
  )

  return(requestId)
}
