contract c18324{
    // Total supply
    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
}