contract c8847{
    /**
    * @dev Withdraw the amount of token that is remaining in this contract.
    * @param _address The address of EOA that can receive token from this contract.
    */
    function withdraw(address _address) public onlyOwner {
        require(stop || now > endTime);
        require(_address != address(0));
        uint tokenBalanceOfContract = getRemainingToken();
        erc223.transfer(_address, tokenBalanceOfContract);
        emit LogWithdrawal(_address, tokenBalanceOfContract);
    }
}