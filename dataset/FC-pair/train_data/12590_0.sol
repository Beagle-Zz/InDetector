contract c12590{
    // ------------------------------------------------------------------------
    // Total suppl
    // ------------------------------------------------------------------------
    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
}