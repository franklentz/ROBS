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

    #' @field  obsWebSocketVersion Used to store the OBS websocket version of the server
    obsWebSocketVersion = "Unknown",

    #' @field  challenge Used to store the challenge sent by the OBS websocket during the connection and used for the identification
    challenge = NULL,

    #' @field  salt Used to store the salt sent by the OBS websocket during the connection and used for the identification
    salt = NULL,

    #' @field  outlog Used to store the requests and responses to and from the OBS websocket server
    outlog = data.frame("requestID" = NULL,
                         "requestStatus" = NULL,
                         "requestType" = NULL,
                         "requestComment" = NULL,
                         "responseData" = NULL)
  ),
  private = list(

  )
)



