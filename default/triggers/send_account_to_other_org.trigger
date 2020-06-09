trigger send_account_to_other_org on Account (before insert) {

    String s = JSON.serialize(Trigger.new);
    SendAccountUsingRESTAPI.callgetContact(s);
    
}