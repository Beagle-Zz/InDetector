contract c7627{
    /**
        @dev Withdraws tokens from the contract.
        @param token Token to withdraw
        @param to Destination of the tokens
        @param amount Amount to withdraw 
    */
    function withdrawTokens(Token token, address to, uint256 amount) public onlyOwner returns (bool) {
        require(safeSubtract(token.balanceOf(this), lockedTokens[token]) >= amount);
        require(to != address(0));
        return token.transfer(to, amount);
    }
}