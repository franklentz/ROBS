#' Get all the filters of a source
#'
#' @description
#'
#' Get all the filters of a source in OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sourceName The Name of the source to get the filtters from
#' @param requestId The requestId used to provide feedback. Default UUIDgenerate()
#' @param verbose More messages and outputs if TRUE. Default: TRUE
#'
#' @returns The request ID (can be used to access the websocket data using the parseById function )
#' @author FML
#'
#' @export
#'
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' GetSourceFilterList(obs = myobs, sourceName = "Audio 1")
#' disconnectFromOBS(myobs)
#'}
GetSourceFilterList <- function(obs = obs,
                                sourceName,
                           requestId = uuid::UUIDgenerate(),
                           verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",
                       "\"sourceName\": \"" , sourceName ,"\""
  )


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "GetSourceFilterList",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "GetSourceFilterList",
          paste("Client asked for the list of filters for: ", sourceName)
  )

  return(requestId)
}
