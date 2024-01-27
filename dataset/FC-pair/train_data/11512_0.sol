contract c11512{
    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public constant returns (uint256) {
        return _totalSupply * (10 ** decimals)  - balances[address(0)];
    }
}