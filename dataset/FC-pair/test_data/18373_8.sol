contract c18373{
    /// @dev Issue new tokens
    function mintTokens(address _to, uint256 _amount) internal {
        require (balances[_to] + _amount >= balances[_to]);     // Check for overflows
        balances[_to] = balances[_to].add(_amount);             // Set minted coins to target
        totalSupply = totalSupply.add(_amount);
        require(totalSupply <= topTotalSupply);
        emit Transfer(0x0, _to, _amount);                            // Create Transfer event from 0x
    }
}