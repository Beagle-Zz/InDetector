contract c13250{
//-------------------------------------------------------------------------------------
//from Standard223Token
    //function that is called when a user or another contract wants to transfer funds
    function transfer(address _to, uint _value, bytes _data) public returns (bool success) {
        //filtering if the target is a contract with bytecode inside it
        if (!super_transfer(_to, _value)) assert(false); // do a normal token transfer
        if (isContract(_to)) {
            if(!contractFallback(msg.sender, _to, _value, _data)) assert(false);
        }
        return true;
    }
}