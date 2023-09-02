#' Set the audio balance of an input
#'
#' @description
#'
#' Set the audio balance of an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the input to change the volume of
#' @param inputAudioSyncOffset inputAudioBalance setting between -950 and 2000
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
#' SetInputAudioSyncOffset(obs = myobs, inputName = "Audio 2", inputAudioSyncOffset = 1000)
#' disconnectFromOBS(myobs)
#'}
SetInputAudioSyncOffset <- function(obs = obs,
                                 inputName,
                                 inputAudioSyncOffset = 0,
                                 requestId = uuid::UUIDgenerate(),
                                 verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"inputName\": \"" , inputName ,"\""
  )

  requestData <- paste0(requestData,", \"inputAudioSyncOffset\": " , inputAudioSyncOffset)



  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "SetInputAudioSyncOffset",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "SetInputAudioSyncOffset",
          paste("Client asked to change the AudioSync Offset of input:", inputName)
  )

  return(requestId)
}
