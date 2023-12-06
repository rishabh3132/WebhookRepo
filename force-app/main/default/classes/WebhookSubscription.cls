@RestResource(urlMapping='/gitRestsave/*')
Global with sharing class WebhookSubscription {
    @HttpPost
    Global static void handleNotification() {
        try {
            RestRequest request= RestContext.request;
            RestResponse response=RestContext.response;
            // String hashedval=request.headers.get('X-Hub-Signature-256');
            Blob bd=request.requestBody;
            System.debug(bd.toString());
            JSONParser jp=JSON.createParser(request.requestBody.toString());
            // Pusher ps;
            // Head_Commit hc;
            // String repo;
            // while(jp.nextToken() != null){
            //     if(jp.nextToken() != null){
            //         jp.nextToken();
            //         ps=(Pusher)jp.readValueAs(Pusher.class);
            //     }
            //     // if(jp.getText()=='head_commit'){
            //     //     jp.nextToken();
            //     //     hc=(Head_Commit)jp.readValueAs(Head_Commit.class);
            //     // }
            //     // if(jp.getText()=='full_name'){
            //     //     jp.nextToken();
            //     //     repo=jp.getText();
            //     //     hc=(Head_Commit)jp.readValueAs(Head_Commit.class);
            //     // }
            // }
            System.debug(response);
        } catch (Exception e) {
            System.debug(e.getMessage());            
        }
    }
    public class SfdcResponse{
        String response;
        String message;
        public SfdcResponse(String resp, String msg){
            response=resp;
            message=msg;
        }
    }
    public class Pusher{
        public String name;
        public String email;
        public Pusher(String n, String e){
            name=n;
            email=e;
        }
    }
}