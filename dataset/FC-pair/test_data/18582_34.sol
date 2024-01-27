contract c18582{
    /// @notice The owner will call this method to extract the tokens
    function collectTokens() public onlyOwner {
        uint256 finalizedTime = contribution.finalizedTime();
        require(finalizedTime > 0 && getTime() > finalizedTime);
        uint256 balance = miniMeToken.balanceOf(address(this));
        collectedTokens = balance;
        miniMeToken.transfer(owner, balance);
        TokensWithdrawn(owner, balance);
    }
}