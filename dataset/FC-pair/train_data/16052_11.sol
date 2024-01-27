contract c16052{
    /**
    * Returns the data associated with the latest ERC20 transaction request in the form of a touple. This data includes:
    * the owner address which requested the transfer, the address of the recipient, the address of the ERC20 token contract
    * and the amount of tokens to send. 
    **/
    function viewLatestErc20TransactionRequest() public view returns(address from, address to, address token, uint256 value) {
        return(latestErc20TxRequest._from, latestErc20TxRequest._to, latestErc20TxRequest._token, latestErc20TxRequest._value);
    }
}