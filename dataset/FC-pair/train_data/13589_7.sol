contract c13589{
    /**
    * @dev Withdraw the amount of token that is remaining in this contract.
    * @param _address The address of EOA that can receive token from this contract.
    */
    function withdraw(address _address) public onlyOwner {
        uint tokenBalanceOfContract = token.balanceOf(this);
        require(_address != address(0) && tokenBalanceOfContract > 0);
        require(token.transfer(_address, tokenBalanceOfContract));
        emit LogWithdrawal(_address, tokenBalanceOfContract);
    }
}