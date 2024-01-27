contract c4425{
    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0x91b6B075d1b5b9945b3b48E9B84D6aB1a4589B8F)];
    }
}