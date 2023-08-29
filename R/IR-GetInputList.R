#' ask for a list of the inputs
#'
#' @description
#'
#' Get the list of the inputs in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param inputKind Restrict the array to only inputs of the specified kind
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
#' GetInputList(obs = myobs)
#' GetInputList(obs = myobs, inputKind = "browser_source")
#' disconnectFromOBS(myobs)
#'}
GetInputList <- function(obs = obs, inputKind=NULL,  requestId = uuid::UUIDgenerate(), verbose = TRUE ){

  # Create the request data
  requestData = paste0("{\"inputKind\": \"" , inputKind ,"\"}")

  if(is.null(inputKind)){
    opCode6(obs = obs,
            requestType = "GetInputList",
            requestId = requestId,
            verbose = verbose
            )
  }else{
    opCode6(obs = obs,
            requestType = "GetInputList",
            requestData = requestData,
            requestId = requestId,
            verbose = verbose
    )
  }

  logThis(obs, requestId, "0", "GetInputList", "Client asked to get the list of inputs")

  return(requestId)
}
