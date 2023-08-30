#' Gets the default settings for an input kind
#'
#' @description
#'
#' Gets the default settings for an input kind in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputKind Input kind to get the default settings for
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
#' GetInputDefaultSettings(obs = myobs, inputKind = "browser_source")
#' disconnectFromOBS(myobs)
#'}
GetInputDefaultSettings <- function(obs = obs,
                                    inputKind,
                        requestId = uuid::UUIDgenerate(),
                        verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",
                       "\"inputKind\": \"" , inputKind ,"\""
  )


  requestData = paste0(requestData, "}")


  opCode6(obs = obs,
          requestType = "GetInputDefaultSettings",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "GetInputDefaultSettings",
          paste("Client asked for the defaults for:", inputKind)
  )

  return(requestId)
}
