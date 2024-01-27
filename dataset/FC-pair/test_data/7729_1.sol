contract c7729{
    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public view returns (uint) {
        return safeSub(_totalSupply , balances[address(0)]);
    }
}