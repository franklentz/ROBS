#' Gets the list of all groups
#'
#' @description
#'
#' Gets the list of all groups from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param requestID The requestID used to provide feedback. Default UUIDgenerate()
#' @author FML
#'
#' @export
#'
#' @examples
#'
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' GetGroupList(obs = myobs)
#' disconnectFromOBS(myobs)

GetGroupList <- function(obs = obs,
                        requestId = uuid::UUIDgenerate(),
                        verbose = TRUE ){


  opCode6(obs = obs,
          requestType = "GetGroupList",
          requestId = requestId,
          verbose = verbose)

  logThis(obs, requestId, "0",
          "GetGroupList",
          paste("Client requested the list of all the groups"))
}
