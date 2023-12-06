@RestResource(urlMapping='/webhook/*')
Global with sharing class WebhookSubscription {
    @HttpPost
    Global static void handleNotification() {
        try {
            RestRequest request= RestContext.request;
            RestResponse response=RestContext.response;
            System.debug(request);
            System.debug(response);
        } catch (Exception e) {
            System.debug(e.getMessage());            
        }
    }
}