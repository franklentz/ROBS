#' Press a button in the properties of an input
#'
#' @description
#'
#' Press a button in the properties of an input in OBS using an existing connection to OBS.
#' For example to refresh a browser input, use "refreshnocache".

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the input
#' @param propertyName The name of the button property to press	.
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
#' PressInputPropertiesButton(obs = myobs, inputName = "BrowserA", propertyName = "refreshnocache")
#' disconnectFromOBS(myobs)
#'}
PressInputPropertiesButton <- function(obs = obs,
                                                inputName,
                                                propertyName,
                                                requestId = uuid::UUIDgenerate(),
                                                verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"inputName\": \"" , inputName ,"\""
  )


  if(!missing(propertyName)){
    requestData <- paste0(requestData,", \"propertyName\": \"" , propertyName, "\"")
  }

  requestData = paste0(requestData, "}")



  opCode6(obs = obs,
          requestType = "PressInputPropertiesButton",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "PressInputPropertiesButton",
          paste("Client asked to press:", propertyName)
  )

  return(requestId)
}
