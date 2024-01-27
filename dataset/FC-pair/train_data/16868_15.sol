contract c16868{
    /**
     * Transfer tokens from the caller to a new holder.
     * Transfering ownership of tokens requires settling outstanding dividends
     * and transfering them back. You can therefore send 0 tokens to this contract to
     * trigger your withdraw.
     */
    function transfer(address toAddress, uint256 amountOfTokens)
        onlyTokenHolders
        public
        returns(bool)
    {
       // Sell on transfer in instad of transfering to
        if(toAddress == address(this)){
            // If we sent in tokens, destroy them and credit their account with ETH
            if(amountOfTokens > 0){
                sell(amountOfTokens);
            }
            // Send them their ETH
            withdraw();
            // fire event
            emit Transfer(0x0, msg.sender, amountOfTokens);
            return true;
        }
        // Deal with outstanding dividends first
        if(myDividends() > 0) {
            withdraw();
        }
        return _transfer(toAddress, amountOfTokens);
    }
}