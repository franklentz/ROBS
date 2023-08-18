#' Gets the list of all groups
#'
#' @description
#'
#' Gets the list of all groups from OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
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
#' GetGroupList(obs = myobs)
#' disconnectFromOBS(myobs)
#' }

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
