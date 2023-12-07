@RestResource(urlMapping='/gitRestsave/*')
Global with sharing class WebhookSubscription {
    @HttpPost
    Global static void handleNotification() {
        try {
            RestRequest request= RestContext.request;
            RestResponse response=RestContext.response;
            // String hashedval=request.headers.get('X-Hub-Signature-256');
            Map<String, Object> responseBodyMap = (Map<String,Object>) JSON.deserializeUntyped(request.requestBody.toString());
            Map<String,Object> repoDetails=(Map<String,Object>)responseBodyMap.get('repository');
            System.debug('Repository Details');
            System.debug('Name - '+repoDetails.get('name'));
            System.debug('Full Name - '+repoDetails.get('full_name'));
            List<Object> commitList=(List<Object>)responseBodyMap.get('commits');
            Map<String,Object> headCommit=(Map<String,Object>)responseBodyMap.get('head_commit');
            System.debug('Commit Message - '+headCommit.get('message'));
            System.debug('Commit Timestamp - '+headCommit.get('timestamp'));
            Map<String, Object> commitMap=(Map<String, Object>)commitList[0];
            System.debug('Commit URL - '+commitMap.get('url'));
            Map<String, Object> authorDetail=(Map<String, Object>)commitMap.get('author');
            System.debug('Author Detail');
            for(String str:authorDetail.keyset()){
                System.debug(str+' - '+authorDetail.get(str));
            }
            System.debug('END');
        } catch (Exception e) {
            System.debug(e.getMessage());            
        }
    }
}