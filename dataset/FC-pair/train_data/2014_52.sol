contract c2014{
    /* only owner address can transfer ether */
    function ownerTransferEther(address sendTo, uint amount) public 
        onlyOwner
    {        
        /* safely update contract balance when sending out funds*/
        contractBalance = safeSub(contractBalance, amount);     
        /* update max profit */
        setMaxProfit();
        if(!sendTo.send(amount)) throw;
        LogOwnerTransfer(sendTo, amount); 
    }
}