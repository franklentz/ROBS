#' Get the list of all the scene collections
#'
#' @description
#'
#' Get the list of all the scene collections (use ViewLog() to get access to the list)

#'
#' @param obs an obs websocket with an active connection. Default obs
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
#' GetSceneCollectionList(obs = myobs)
#' disconnectFromOBS(myobs)
#'}
GetSceneCollectionList <- function(obs = obs, requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data

  opCode6(obs = obs,
          requestType = "CreateSceneCollection",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0", "GetSceneCollectionList", "Client asked for the list of scene collections")

}
