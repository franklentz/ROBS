#' View the log of requests and the responses
#'
#' @description
#' Use this to access to the values returned by your requests
#'
#' @param obs an OBSwebsocket object
#' @author FML
#' @return a data frame with the status of the request and the returned values
#' @importFrom utils View
#' @export
#'
#' @examples
#' \dontrun{
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' GetSceneSceneTransitionOverride(obs = myobs, scene = "Muti Cam Scene" )
#' ViewLog(myobs)
#' disconnectFromOBS(myobs)
#' }
ViewLog <- function(obs){
  View(obs$outlog)
}
