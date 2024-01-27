contract c13764{
    /**
     * @dev Function to purchase tokens
     * @return A boolean that indicates if the operation was successful.
     */
    function purchase() whenNotLocked canPurchase public payable returns (bool) {
        uint256 ethAmount = msg.value;
        uint256 tokenAmount = ethAmount.div(tokenPrice_).mul(10 ** uint256(decimals));
        require(totalSupply_.add(tokenAmount) <= actualCap_);
        totalSupply_ = totalSupply_.add(tokenAmount);
        balances[msg.sender] = balances[msg.sender].add(tokenAmount);
        etherAmount_ = etherAmount_.add(ethAmount);
        emit onPurchase(msg.sender, ethAmount, tokenAmount);
        emit Transfer(address(0), msg.sender, tokenAmount);
        return true;
    }
}