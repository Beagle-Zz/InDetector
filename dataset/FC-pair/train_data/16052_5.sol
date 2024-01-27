contract c16052{
    /**
    * Creates an ERC20 transaction request which will be stored in the contract's state. The transaction
    * will only go through if it is confirmed by at least one more owner address. If this function is 
    * called before a previous ERC20 transaction request has been confirmed, then it will be overridden. This
    * function can only be called by one of the owner addresses. 
    * 
    * @param _token The address of the ERC20 token contract
    * @param _to The address of the recipient
    * @param _value The amount of tokens to be sent
    **/
    function requestErc20Transfer(address _token, address _to, uint256 _value) public onlyAuthorisedAddresses {
        ERC20TransferInterface token = ERC20TransferInterface(_token);
        require(_to != 0x0 && _value > 0 && token.balanceOf(address(this)) >= _value);
        latestErc20TxRequest = Erc20TransactionRequest(msg.sender, _to, _token, _value);
        TransferOfErc20Requested(msg.sender, _to, _token, _value);
    }
}