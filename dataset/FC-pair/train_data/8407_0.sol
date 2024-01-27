contract c8407{
// ------------------------------------------------------------------------
// --- Total supply
// ------------------------------------------------------------------------
    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
}