contract c16118{
    /* only owner address can transfer ether */
    function ownerTransferEther(address sendTo, uint amount) public
    onlyOwner
    {
        /* safely update contract balance when sending out funds*/
        contractBalance = safeSub(contractBalance, amount);
        if (!sendTo.send(amount)) throw;
        LogOwnerTransfer(sendTo, amount);
    }
}