contract c40263{
     
    function SendETC(address ETCAddress) returns(bool){
        uint Value = msg.value - (msg.value*Fee/Decs);
         
        if(!IsHeOnTheFork.forked() && ETCAddress.send(Value)){
            ETCTransfer(msg.sender, ETCAddress, Value);
            return true;
        }
         
        throw;
    }
}