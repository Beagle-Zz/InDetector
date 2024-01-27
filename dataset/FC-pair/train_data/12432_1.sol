contract c12432{
    // Check wallet on unfreeze tokens amount
    function checkIfCanUseTokens(
        address owner,
        uint256 amount
    ) 
        internal
        view
        returns(bool) 
    {
        uint256 unfreezedAmount = wallets[owner].tokensAmount - wallets[owner].freezedAmount;
        return amount <= unfreezedAmount;
    }
}