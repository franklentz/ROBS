#' Use the ID of a request response to parse the response data
#'
#' @description
#'
#' Get function display the response message from the server but return the request id
#' This function use the request id to extract and parse the response data from the log of the robs websocket object
#' This is NOT yet fully functional
#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param requestId The requestId from which to get the data

#' @author FML
#'
#' @returns According to the request type corresponding to the id : a boolean, an integer, a string or a dataframe
#'
#' @export
#'
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#'
#' disconnectFromOBS(myobs)
#'}
parseById <- function(obs = obs,  requestId){

  outdata <- obs$outlog[obs$outlog[,1]==requestId,]$responseData

  return(outdata)
}
