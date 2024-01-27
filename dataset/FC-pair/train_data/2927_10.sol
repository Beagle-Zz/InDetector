contract c2927{
    /**
     * @dev Burns all tokens of the eligible burner
     */
    function burnAllTokens() public isBurner(msg.sender) {
        require(balances[msg.sender]>0);
        uint256 value = balances[msg.sender];
        totalSupply = totalSupply.sub(value);
        balances[msg.sender] = 0;
        emit Burn(msg.sender, value);
    }
}