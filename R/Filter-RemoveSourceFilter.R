#' Removes a filter for a source
#'
#' @description
#'
#' Removes a filter for a source in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sourceName The name of the target source to add the filter
#' @param filterName The name of the filter to create
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
#' RemoveSourceFilter(obs = myobs, sourceName= "Audio 1", filterName = "MyLimiterFilter")
#' disconnectFromOBS(myobs)
#'}
RemoveSourceFilter <- function(obs = obs,
                               sourceName,
                               filterName,
                               requestId = uuid::UUIDgenerate(),
                               verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"sourceName\": \"" , sourceName ,"\", ",
                       "\"filterName\": \"" , filterName ,"\""
  )

  requestData = paste0(requestData, "}")

  #  requestData = paste0(requestData, ", \"sceneItemEnabled\": " , tolower(sceneItemEnabled), "}")



  opCode6(obs = obs,
          requestType = "RemoveSourceFilter",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "RemoveSourceFilter",
          paste("Client asked to remove a filter from source:", sourceName)
  )

  return(requestId)
}
