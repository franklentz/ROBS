#' Sets the settings of an input
#'
#' @description
#'
#' Sets the settings of an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputName The Name of the new input to be created
#' @param inputSettings The settings of the new input. If missing the input will be created with default settings
#' @param overlay Apply the settings on top of existing ones if TRUE or reset the input to its defaults before applying settings if FALSE. Default TRUE
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
#' SetInputSettings(obs = myobs, inputName = "New Browser", inputsSettings = '{"height":602,"width":802}')
#' disconnectFromOBS(myobs)
#'}
SetInputSettings <- function(obs = obs,
                        inputName,
                        inputSettings,
                        overlay = TRUE,
                        requestId = uuid::UUIDgenerate(),
                        verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"inputName\": \"" , inputName ,"\""
  )


  requestData = paste0(requestData, ", \"overlay\": " , tolower(overlay))

  if(!missing(inputSettings)){
    requestData <- paste0(requestData,", \"inputSettings\": " , inputSettings)
  }

  requestData = paste0(requestData, "}")

  #  requestData = paste0(requestData, ", \"sceneItemEnabled\": " , tolower(sceneItemEnabled), "}")



  opCode6(obs = obs,
          requestType = "SetInputSettings",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "SetInputSettings",
          paste("Client asked to change the settings of new input:", inputName)
  )

  return(requestId)
}
