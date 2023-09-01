#' Set the volume of an input
#'
#' @description
#'
#' Set the volume of an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the input to change the volume of
#' @param inputVolumeMul Volume setting in mul between 0 and 20
#' @param inputVolumeDb Volume setting in dB between -100 and 26
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
#' SetInputVolume(obs = myobs, inputName = "Audio 2", inputVolumeMul = 10)
#' disconnectFromOBS(myobs)
#'}
SetInputVolume <- function(obs = obs,
                         inputName,
                         inputVolumeMul = NULL,
                         inputVolumeDb = NULL,
                         requestId = uuid::UUIDgenerate(),
                         verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"inputName\": \"" , inputName ,"\""
  )


  if(!missing(inputVolumeMul)){
    requestData <- paste0(requestData,", \"inputVolumeMul\": " , inputVolumeMul)
  }

  if(!missing(inputVolumeDb)){
    requestData <- paste0(requestData,", \"inputVolumeDb\": " , inputVolumeDb)
  }


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "SetInputVolume",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "SetInputVolume",
          paste("Client asked to change the volume of input:", inputName)
  )

  return(requestId)
}
