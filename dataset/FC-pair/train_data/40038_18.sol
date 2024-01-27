contract c40038{
     
    function kill(address _to) onlymanyowners(sha3(msg.data)) external {
         
         
         
         
        if (tokenCtr.tokenSwapLock()) throw;
        suicide(_to);
    }
}