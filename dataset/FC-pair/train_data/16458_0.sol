contract c16458{
    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public constant returns (uint256) {
        return _totalSupply  - balances[address(0)];
    }
}