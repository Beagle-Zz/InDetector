contract c3745{
    /// @notice Create `mintedAmount` tokens and send it to `target`
    /// @param target Address to receive the tokens
    /// @param mintedAmount the amount of tokens it will receive
    function mintToken(address target, uint256 mintedAmount) onlyOwner public {
        uint tempSupply = totalSupply;
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        require(totalSupply >= tempSupply);
        emit Transfer(0, this, mintedAmount);
        emit Transfer(this, target, mintedAmount);
    }
}