contract c13489{
    /* @dev returns totalSupply of tokens.
     */
    function totalSupply() public constant returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
}