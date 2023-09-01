#' Set the audio balance of an input
#'
#' @description
#'
#' Set the audio balance of an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the input to change the volume of
#' @param inputAudioBalance inputAudioBalance setting between 0 and 1
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
#' SetInputAudioBalance(obs = myobs, inputName = "Audio 2", inputAudioBalance = 0.5)
#' disconnectFromOBS(myobs)
#'}
SetInputAudioBalance <- function(obs = obs,
                           inputName,
                           inputAudioBalance = NULL,
                           requestId = uuid::UUIDgenerate(),
                           verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"inputName\": \"" , inputName ,"\""
  )

    requestData <- paste0(requestData,", \"inputAudioBalance\": " , inputAudioBalance)



  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "SetInputAudioBalance",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "SetInputAudioBalance",
          paste("Client asked to change the inputAudioBalance of input:", inputName)
  )

  return(requestId)
}
