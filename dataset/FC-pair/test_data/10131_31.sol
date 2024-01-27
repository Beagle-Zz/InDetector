contract c10131{
    /**
     * @notice Get the token total supply
     */
    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
}