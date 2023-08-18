#' Create a new scene collection
#'
#' @description
#'
#' Create a new scene collection and switch to it so you can directly store your new scenes

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sceneCollectionName Name for the new scene collection. Default "New Collection"
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
#' CreateSceneCollection(obs = myobs, sceneCollectionName="NewCollectionName")
#' disconnectFromOBS(myobs)
#'}
CreateSceneCollection <- function(obs = obs, sceneCollectionName = "New Collection", requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data

  requestData = paste0("{
    \"sceneCollectionName\": \"", sceneCollectionName ,"\"
  }")

  opCode6(obs = obs,
          requestType = "CreateSceneCollection",
          requestId = requestId,
          requestData = requestData,
          verbose = verbose)

  logThis(obs, requestId, "0", "CreateSceneCollection", paste("Client asked to create a new scene collection named", sceneCollectionName))

}
