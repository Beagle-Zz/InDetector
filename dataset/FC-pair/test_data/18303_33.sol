contract c18303{
    // ERC20 standard function
    function allowance(address _owner, address _spender) external constant returns (uint256) {
        return allowed[_owner][_spender];
    }
}