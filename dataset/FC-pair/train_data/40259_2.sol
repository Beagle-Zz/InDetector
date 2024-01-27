contract c40259{
     
    function SendETC(address ETCAddress) returns(bool){
        uint Value = msg.value - (msg.value*Fee/Decs);
         
        if(!IsEthereum && ETCAddress.send(Value)){
            ETCTransfer(msg.sender, ETCAddress, Value);
            return true;
        } else if(IsEthereum && msg.sender.send(msg.value)){
            ETHReturn(msg.sender, msg.value);
            return true;
        }
         
        throw;
    }
}