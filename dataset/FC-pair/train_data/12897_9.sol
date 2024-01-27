contract c12897{
    // get allowance
    function allowance(address _owner, address _spender) 
    public
    constant 
    returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}