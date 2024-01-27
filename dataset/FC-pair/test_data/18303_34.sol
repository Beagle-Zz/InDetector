contract c18303{
    // ERC20 standard function
    function balanceOf(address _owner) external constant returns (uint256 balance) {
        return balances[_owner];
    }
}