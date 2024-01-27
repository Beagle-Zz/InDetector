contract c7010{
    /// @dev Destroy Tokens
    ///@param destroyAmount Count Token
    function destroyToken(uint256 destroyAmount) onlyOwner {
        destroyAmount = destroyAmount.mul(10 ** decimals);
        balanceOf[owner] = balanceOf[owner].sub(destroyAmount);
        totalSupply = totalSupply.sub(destroyAmount);
    }
}