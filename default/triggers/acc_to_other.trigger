trigger acc_to_other on Account (after insert) {

    for ( Account a : Trigger.new ){
        call_api.send_acc(a.name);
    }
    
}