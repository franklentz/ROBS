#' ask for a list of the input kinds
#'
#' @description
#'
#' Get the list of the input kinds in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param unversioned True: Return all kinds as unversioned, False: Return with version suffixes
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
#' GetInputKindList(obs = myobs)
#' GetInputKindList(obs = myobs, unversioned = TRUE)
#' disconnectFromOBS(myobs)
#'}
GetInputKindList <- function(obs = obs, unversioned = FALSE,  requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data
  requestData = paste0("{\"unversioned\": " , tolower(unversioned) ,"}")


    opCode6(obs = obs,
            requestType = "GetInputKindList",
            requestData = requestData,
            requestId = requestId,
            verbose = verbose
    )

  logThis(obs, requestId, "0", "GetInputKindList", "Client asked to get the list of input kinds")

  return(requestId)
}
