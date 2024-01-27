contract c16052{
    /**
    * Rejects ERC20 transaction requests and erases all data associated with the request. This function can only be called
    * by one of the owner addresses. 
    **/
    function rejectErx20TransactionRequest() public onlyAuthorisedAddresses {
        latestErc20TxRequest = Erc20TransactionRequest(0x0, 0x0, 0x0, 0);
        Erc20TransactionRejected(msg.sender);
    }
}