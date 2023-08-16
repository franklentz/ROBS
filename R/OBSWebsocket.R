#' R OBS Websocket Class
#'
#' @description
#'
#' Create a websocket client to connect to OBS and send commands.
#' The WebSocket server (Use "Tools" menu in OBS) must be activated.
#'
#' @author FML
#'
#' @import websocket
#' @export
#'
#' @examples
#'
#' myobs <- createOBSWebsocket()
#' connectToOBS(obs = myobs)
#' identifyToOBS(obs = myobs, eventSub = "33", password = "OBSwebsocketServerPassword")
#' disconnectFromOBS(myobs)

# ----------------------------------------------------------------

# Doc : https://github.com/obsproject/obs-websocket/blob/release/5.2.3/docs/generated/protocol.md

# --------------------------


OBSWebSocket <- R6::R6Class(
  "OBSWebSocket",
  inherit = websocket::WebSocket,
  lock_class = TRUE,
  public = list(
    obsWebSocketVersion = "Unknown",
    challenge = NULL,
    salt = NULL,
    outlog = data.frame("requestID" = NULL,
                         "requestStatus" = NULL,
                         "requestType" = NULL,
                         "requestComment" = NULL,
                         "responseData" = NULL)
  ),
  private = list(

  )
)



