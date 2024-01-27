contract c16868{
    /**
     * Converts all incoming counter to tokens for the caller
     */
    function purchaseTokensERC20(uint256 amount)
        public
        erc20Destination
        returns(uint256)
    {
        require(ERC20Interface(counter).transferFrom(msg.sender, this, amount));
        return purchaseTokens(amount);
    }
}