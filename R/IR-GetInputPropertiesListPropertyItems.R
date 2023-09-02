#' Gets the items of a list property for an input
#'
#' @description
#'
#' Gets the items of a list property for an input in OBS using an existing connection to OBS.
#' For example get the list of available display for display capture from the monitor_id list.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the input
#' @param propertyName The name of the property to get the list of items from.
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
#' GetInputPropertiesListPropertyItems(obs = myobs, inputName = "Display Capture 1", propertyName = "monitor_id")
#' disconnectFromOBS(myobs)
#'}
GetInputPropertiesListPropertyItems <- function(obs = obs,
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
          requestType = "GetInputPropertiesListPropertyItems",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "GetInputPropertiesListPropertyItems",
          paste("Client asked the list of items for:", propertyName)
  )

  return(requestId)
}
