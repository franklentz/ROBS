#' Mute or Unmute an input
#'
#' @description
#'
#' Mute or Unmute an input in OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the new input to get the settings from
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
#' ToggleInputMute(obs = myobs, inputName = "Audio 1")
#' disconnectFromOBS(myobs)
#'}
ToggleInputMute <- function(obs = obs,
                         inputName,
                         requestId = uuid::UUIDgenerate(),
                         verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",
                       "\"inputName\": \"" , inputName ,"\""
  )


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "ToggleInputMute",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "ToggleInputMute",
          paste("Client asked to toggle mute state of input: ", inputName)
  )

  return(requestId)
}
