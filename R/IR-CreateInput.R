#' Create an input
#'
#' @description
#'
#' Create an input in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneName The scene to which the input will be added
#' @param inputName The Name of the new input to be created
#' @param inputKind The kind of input to be created
#' @param inputSettings The settings of the new input. If missing the input will be created with default settings
#' @param sceneItemEnabled Whether to set the created scene item to enabled or disabled. Default TRUE
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
#' CreateInput(obs = myobs, sceneName = "Two cams", inputName = "New Browser", inputKind = "browser_source")
#' CreateInput(obs = myobs, sceneName = "Two cams", inputName = "New Browser B", inputKind = "browser_source", inputSettings = '{"height":602,"width":802}')
#' disconnectFromOBS(myobs)
#'}
CreateInput <- function(obs = obs,
                         sceneName,
                         inputName,
                         inputKind,
                         inputSettings,
                         sceneItemEnabled = TRUE,
                         requestId = uuid::UUIDgenerate(),
                         verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"sceneName\": \"" , sceneName ,"\", ",
                       "\"inputName\": \"" , inputName ,"\", ",
                       "\"inputKind\": \"" , inputKind ,"\""
  )


  requestData = paste0(requestData, ", \"sceneItemEnabled\": " , tolower(sceneItemEnabled))

  if(!missing(inputSettings)){
    requestData <- paste0(requestData,", \"inputSettings\": " , inputSettings)
  }

  requestData = paste0(requestData, "}")

#  requestData = paste0(requestData, ", \"sceneItemEnabled\": " , tolower(sceneItemEnabled), "}")



  opCode6(obs = obs,
          requestType = "CreateInput",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "CreateInput",
          paste("Client asked to create a new input:", inputName)
  )

  return(requestId)
}
