#' Gets the settings of an input
#'
#' @description
#'
#' Gets the settings of an input in OBS using an existing connection to OBS.
#' This does not include the defaul settings. (Defaults are provided by GetInputDefaultSettings)
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
#' GetInputSettings(obs = myobs, inputName = "New Browser")
#' disconnectFromOBS(myobs)
#'}
GetInputSettings <- function(obs = obs,
                        inputName,
                        requestId = uuid::UUIDgenerate(),
                        verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",
                       "\"inputName\": \"" , inputName ,"\""
  )


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "GetInputSettings",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "GetInputSettings",
          paste("Client asked the settings for input: ", inputName)
  )

  return(requestId)
}
