contract c40055{
 
 
 
 
    function doPayment(address _owner) internal {
 
        if ((now<startFundingTime) ||
            (now>endFundingTime) ||
            (tokenContract.tokenController() == 0) ||            
            (msg.value == 0) ||
            (totalCollected + msg.value > maximumFunding))
        {
            throw;
        }
 
        totalCollected += msg.value;
 
        if (!vaultContract.send(msg.value)) {
            throw;
        }
 
 
        if (!tokenContract.createTokens(_owner, msg.value)) {
            throw;
        }
        return;
    }
}