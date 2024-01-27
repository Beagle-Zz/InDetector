contract c16052{
    /**
    * Returns the data associated with the latest ETH transaction request in the form of a touple. This data includes:
    * the owner address which requested the transfer, the address of the recipient and the value of the transfer 
    * specified in units of wei. 
    **/
    function viewLatestEthTransactionRequest() public view returns(address from, address to, uint256 valueInWei) {
        return (latestEthTxRequest._from, latestEthTxRequest._to, latestEthTxRequest._valueInWei);
    }
}