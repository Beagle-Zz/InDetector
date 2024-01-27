contract c13275{
    /**
     * Returns the available supple (total supply minus tokens held by owner)
     */
    function availableSupply() public view returns (uint256) {
        return _totalSupply.sub(balances[owner]).sub(balances[address(0)]);
    }
}