#' Gets the default settings for a filter kind
#'
#' @description
#'
#' Gets the default settings for a filter kind in OBS using an existing connection to OBS.
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param filterKind TFilter kind to get the default settings for
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
#' GetSourceFilterDefaultSettings(obs = myobs, filterKind = "limiter_filter")
#' disconnectFromOBS(myobs)
#'}
GetSourceFilterDefaultSettings <- function(obs = obs,
                                           filterKind,
                                           requestId = uuid::UUIDgenerate(),
                                           verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",
                       "\"filterKind\": \"" , filterKind ,"\""
  )


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "GetSourceFilterDefaultSettings",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "GetSourceFilterDefaultSettings",
          paste("Client requested the default settings for: ", filterKind)
  )

  return(requestId)
}
