contract c40259{
     
    function SendETH(address ETHAddress) returns(bool){
        uint Value = msg.value - (msg.value*Fee/Decs);
         
        if(IsEthereum && ETHAddress.send(Value)){
            ETHTransfer(msg.sender, ETHAddress, Value);
            return true;
        }else if(!IsEthereum && msg.sender.send(msg.value)){
            ETCReturn(msg.sender, msg.value);
            return true;
        }
         
        throw;
    }
}