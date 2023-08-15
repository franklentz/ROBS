#' Create a new scene
#'
#' @description
#'
#' Create a new scene in the current collection in OBS.
#'
#' @param scene The name of the scene to switch to create
#'
#' @author FML
#'
#' @export
#'
#' @examples
#'
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' CreateScene(obs = myobs, scene = "New Scene")
#' disconnectFromOBS(myobs)

CreateScene <- function(obs = obs, scene = "New", requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data

  requestData = paste0("{
    \"sceneName\": \"", scene ,"\"
  }")

  # Send an opCode6

  opCode6(obs = obs,
          requestType = "CreateScene",
          requestId = requestId,
          requestData,
          verbose = verbose)

  # Log the request

  # obs$outlog <- rbind(obs$outlog, data.frame("requestId" = requestId,
  #                                            "requestStatus" = 0,
  #                                            "requestType" = "CreateScene",
  #                                            "requestComment" = paste("Client asked to create", scene)
  #                                            )
  #                     )

  logThis(obs, requestId, "0", "CreateScene", paste("Client asked to create", scene))

  return(requestId)

}


