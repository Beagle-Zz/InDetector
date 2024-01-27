contract c40263{
     
    function SendETH(address ETHAddress) returns(bool){
        uint Value = msg.value - (msg.value*Fee/Decs);
         
        if(IsHeOnTheFork.forked() && ETHAddress.send(Value)){
            ETHTransfer(msg.sender, ETHAddress, Value);
            return true;
        }
         
        throw;
    }
}