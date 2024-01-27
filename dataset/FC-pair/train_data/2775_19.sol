contract c2775{
    /**
     * Allows for previously suspected fraudulent ERC20 tokens to become unbanned by the owner
     * of the contract. Any attempt made by any other account to invoke the function will 
     * result in a loss of gas and the token to remain banned.
     * 
     * @param _tokenAddr The contract address of the ERC20 token to be banned from being airdropped. 
     * 
     * @return true if function executes successfully, false otherwise.
     **/
    function unbanToken(address _tokenAddr) public onlyOwner returns(bool) {
        require(tokenIsBanned[_tokenAddr]);
        tokenIsBanned[_tokenAddr] = false;
        TokenUnbanned(_tokenAddr);
        return true;
    }
}