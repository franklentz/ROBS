#' Create a new scene
#'
#' @description
#'
#' Create a new scene in the current collection in OBS.
#'
#' @param obs An obs websocket with an active connection. Default obs
#' @param sceneName The name of the scene to create
#' @param requestId The requestId used to provide feedback. Default UUIDgenerate()
#' @param verbose More messages and outputs if TRUE. Default: TRUE
#'
#' @author FML
#'
#' @export
#'
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' CreateScene(obs = myobs, sceneName = "New Scene")
#' disconnectFromOBS(myobs)
#' }

CreateScene <- function(obs = obs, sceneName = "New", requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data

  requestData = paste0("{
    \"sceneName\": \"", sceneName ,"\"
  }")

  # Send an opCode6

  opCode6(obs = obs,
          requestType = "CreateScene",
          requestId = requestId,
          requestData = requestData,
          verbose = verbose)

  # Log the request

  logThis(obs, requestId, "0", "CreateScene", paste("Client asked to create", sceneName))

  return(requestId)

}


