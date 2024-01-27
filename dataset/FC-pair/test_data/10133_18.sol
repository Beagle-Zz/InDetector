contract c10133{
    /**
     * @notice Get the token total supply
     */
    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
}