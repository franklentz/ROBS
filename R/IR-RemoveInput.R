#' Remove an input
#'
#' @description
#'
#' Remove an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the new input to be removed
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
#' RemoveInput(obs = myobs, inputName = "New Browser")
#' disconnectFromOBS(myobs)
#'}
RemoveInput <- function(obs = obs,
                        inputName,
                        requestId = uuid::UUIDgenerate(),
                        verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",
                       "\"inputName\": \"" , inputName ,"\""
  )


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "RemoveInput",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "RemoveInput",
          paste("Client asked to remove input: ", inputName)
  )

  return(requestId)
}
