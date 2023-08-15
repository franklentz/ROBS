# --------------------------------------------------------------
#-                  op code 6 functions                        -
# --------------------------------------------------------------


# ----------------------------------------------------------------

# Doc : https://github.com/obsproject/obs-websocket/blob/release/5.2.3/docs/generated/protocol.md#request-opcode-6

# --------------------------


opCode6 <- function(obs, requestType, requestId = 1, requestData, verbose = TRUE){

  if(missing(requestData)){

    strMessage = paste0("
           {
    \"op\": 6,
    \"d\": {
      \"requestType\": \"", requestType ,
    "\",\"requestId\": \"", requestId,
    "\"}}")
  }else{
    strMessage = paste0("
          {
          \"op\": 6,
          \"d\": {
                  \"requestType\": \"", requestType ,
          "\",\"requestId\": \"", requestId,
          "\",\"requestData\": ", requestData,
          "}
                }"
    )
  }

  if(verbose == TRUE){
    message(strMessage)
  }

  obs$send(strMessage)
}


# -----------------
