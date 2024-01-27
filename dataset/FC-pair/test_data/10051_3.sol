contract c10051{
   /**
     * Set a token contract address and available tokens and the available tokens
     * 
     */
    function setTokenReward(address _address, uint amount) public onlyOwner {
        tokenReward = token(_address);
        availableTokens = amount;
    }
}