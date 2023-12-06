@RestResource(urlMapping='/gitRestsave/*')
Global with sharing class WebhookSubscription {
    @HttpPost
    Global static void handleNotification() {
        try {
            RestRequest request= RestContext.request;
            RestResponse response=RestContext.response;
            String hashedval=request.headers.get('X-Hub-Signature-256');
            Blob bd=request.requestBody;
            System.debug(bd.toString());

            System.debug(response);
        } catch (Exception e) {
            System.debug(e.getMessage());            
        }
    }
}