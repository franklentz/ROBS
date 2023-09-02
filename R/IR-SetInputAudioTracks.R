#' Sets the settings of audio tracks for an input
#'
#' @description
#'
#' Sets the settings of audio tracks for an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the input
#' @param inputAudioTracks The settings of the Audio Tracks.
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
#' SetInputAudioTracks(obs = myobs, inputName = "Audio 1", inputAudioTracks = '{"1":true,"2":true,"3":true}')
#' disconnectFromOBS(myobs)
#'}
SetInputAudioTracks <- function(obs = obs,
                             inputName,
                             inputAudioTracks,
                             requestId = uuid::UUIDgenerate(),
                             verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"inputName\": \"" , inputName ,"\""
  )


  if(!missing(inputAudioTracks)){
    requestData <- paste0(requestData,", \"inputAudioTracks\": " , inputAudioTracks)
  }

  requestData = paste0(requestData, "}")



  opCode6(obs = obs,
          requestType = "SetInputAudioTracks",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "SetInputAudioTracks",
          paste("Client asked to change the settings of Audio Tracks for input:", inputName)
  )

  return(requestId)
}
