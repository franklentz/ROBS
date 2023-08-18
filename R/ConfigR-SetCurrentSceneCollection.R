#' Switch the current scene collection
#'
#' @description
#'
#' Switches to the specified scene collection.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneCollectionName Name for the scene collection to switch to.
#' @param requestId The requestId used to provide feedback. Default UUIDgenerate()
#' @param verbose More messages and outputs if TRUE. Default TRUE
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
#' SetCurrentSceneCollection(obs = myobs, sceneCollectionName="Main")
#' disconnectFromOBS(myobs)
#'}
SetCurrentSceneCollection <- function(obs = obs, sceneCollectionName, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data

  requestData = paste0("{
    \"sceneCollectionName\": \"", sceneCollectionName ,"\"
  }")

  opCode6(obs = obs,
          requestType = "SetCurrentSceneCollection",
          requestId = requestId,
          requestData = requestData,
          verbose = verbose)

  logThis(obs, requestId, "0", "SetCurrentSceneCollection", paste("Client asked to switch to", sceneCollectionName))

}
