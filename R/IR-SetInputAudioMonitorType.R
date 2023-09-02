#' Change the audio monitor type of an input
#'
#' @description
#'
#' Change the Change the audio monitor type of an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The name of the input
#' @param monitorType The new monitorType for the input (OBS_MONITORING_TYPE_NONE, OBS_MONITORING_TYPE_MONITOR_ONLY,OBS_MONITORING_TYPE_MONITOR_AND_OUTPUT
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
#' SetInputAudioMonitorType(obs = myobs, inputName = "Audio 1", monitorType = "OBS_MONITORING_TYPE_MONITOR_ONLY")
#' disconnectFromOBS(myobs)
#'}
SetInputAudioMonitorType <- function(obs = obs,
                         inputName,
                         monitorType,
                         requestId = uuid::UUIDgenerate(),
                         verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",
                       "\"inputName\": \"" , inputName ,"\"",
                       ", \"monitorType\": \"" , monitorType ,"\""
  )


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "SetInputAudioMonitorType",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "SetInputAudioMonitorType",
          paste("Client asked to Change the audio monitor type for ", inputName, "to", monitorType)
  )

  return(requestId)
}
