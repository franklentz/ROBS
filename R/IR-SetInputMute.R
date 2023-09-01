#' Mute or unmute an input
#'
#' @description
#'
#' Sets the audio mute state of an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the new input to be muted or unmuted
#' @param inputMuted Whether to mute the input or not. Default TRUE
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
#' SetInputMute(obs = myobs, inputName = "Audio 2", inputMuted = FALSE)
#' disconnectFromOBS(myobs)
#'}
SetInputMute <- function(obs = obs,
                             inputName,
                             inputMuted = TRUE,
                             requestId = uuid::UUIDgenerate(),
                             verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"inputName\": \"" , inputName ,"\""
  )


  requestData = paste0(requestData, ", \"inputMuted\": " , tolower(inputMuted))


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "SetInputMute",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "SetInputMute",
          paste("Client asked to change the mute state of input:", inputName)
  )

  return(requestId)
}
