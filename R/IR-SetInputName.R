#' Change the name of an input
#'
#' @description
#'
#' Change the name of an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The name of the new input to be changed
#' @param newInputName The new name for the input
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
#' SetInputName(obs = myobs, inputName = "New Browser", newInputName = "Main Browser")
#' disconnectFromOBS(myobs)
#'}
SetInputName <- function(obs = obs,
                        inputName,
                        newInputName,
                        requestId = uuid::UUIDgenerate(),
                        verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",
                       "\"inputName\": \"" , inputName ,"\"",
                       ", \"newInputName\": \"" , newInputName ,"\""
  )


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "SetInputName",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "SetInputName",
          paste("Client asked to Change input:", inputName, "into", newInputName)
  )

  return(requestId)
}
