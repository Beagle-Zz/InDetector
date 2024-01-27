contract c7865{
    // Freeze tokens on sender wallet if have permission.
    function freezeTokens(uint256 amount, uint unfreezeDate)
        public
        isFreezeAllowed
        returns(bool)
    {
        //We can freeze tokens only if there are no frozen tokens on the wallet.
        require(wallets[msg.sender].freezedAmount == 0
        && wallets[msg.sender].tokensAmount >= amount); 
        wallets[msg.sender].freezedAmount = amount;
        wallets[msg.sender].unfreezeDate = unfreezeDate;
        emit FreezeTokens(msg.sender, amount);
        return true;
    }
}