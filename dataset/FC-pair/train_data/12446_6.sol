contract c12446{
    /// @dev Airdrops some tokens to some accounts.
    /// @param dests List of account addresses.
    /// @param values List of token amounts.
    function airdrop(address[] dests, uint[] values) public onlyOwner {
        require(dests.length == values.length);
        for (uint256 i = 0; i < dests.length; i++) {
            token.transfer(dests[i], values[i].mul(multiplier));
        }
    }
}