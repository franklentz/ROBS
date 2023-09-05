#' Creates a new filter for a source
#'
#' @description
#'
#' Creates a new filter for a source in OBS using an existing connection to OBS.

#'
#' @param obs an obs websocket with an active connection. Default obs
#' @param sourceName The name of the target source to add the filter
#' @param filterName The name of the filter to create
#' @param filterKind The kind of the filter to create
#' @param filterSettings The settings of the new filter. If missing the filter will be created with default settings
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
#' CreateSourceFilter(obs = myobs, sourceName= "Audio 1", filterName = "MyLimiterFilter", filterKind = "limiter_filter", filterSettings = '{"release_time":50,"threshold":-5.0}')
#' disconnectFromOBS(myobs)
#'}
CreateSourceFilter <- function(obs = obs,
                             sourceName,
                             filterName,
                             filterKind,
                             filterSettings,
                             requestId = uuid::UUIDgenerate(),
                             verbose = TRUE ){

  # Create the request data
  requestData = paste0("{",

                       "\"sourceName\": \"" , sourceName ,"\", ",
                       "\"filterName\": \"" , filterName ,"\", ",
                       "\"filterKind\": \"" , filterKind ,"\""
  )

  if(!missing(filterSettings)){
    requestData <- paste0(requestData,", \"filterSettings\": " , filterSettings)
  }

  requestData = paste0(requestData, "}")

  #  requestData = paste0(requestData, ", \"sceneItemEnabled\": " , tolower(sceneItemEnabled), "}")



  opCode6(obs = obs,
          requestType = "CreateSourceFilter",
          requestData = requestData,
          requestId = requestId,
          verbose = verbose
  )


  logThis(obs, requestId, "0", "CreateSourceFilter",
          paste("Client asked to create a new filter for source:", sourceName)
  )

  return(requestId)
}
