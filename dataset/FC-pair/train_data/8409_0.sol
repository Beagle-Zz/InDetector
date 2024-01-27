contract c8409{
                // ------------------------------------------------------------------------
                // Total supply
                // ------------------------------------------------------------------------
                function totalSupply() public constant returns (uint) {
                    return _totalSupply  - balances[address(0)];
                }
}