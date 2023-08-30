#' Ask for a list of the special inputs
#'
#' @description
#'
#' Get the list of the special inputs in OBS using an existing connection to OBS.
#' (Desktop audio, mic...)

#'
#' @param obs an obs websocket with an active connection. Default obs
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
#' GetSpecialInputs(obs = myobs)
#' disconnectFromOBS(myobs)
#'}
GetSpecialInputs <- function(obs = obs, requestId = uuid::UUIDgenerate(), verbose = TRUE ){


  opCode6(obs = obs,
          requestType = "GetSpecialInputs",
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "GetSpecialInputs", "Client asked to get the list of special inputs")

  return(requestId)
}
