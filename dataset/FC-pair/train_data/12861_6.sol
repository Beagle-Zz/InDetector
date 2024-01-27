contract c12861{
    /* Get the amount of allowed tokens to spend */
    function allowance(address _owner, address _spender) constant public returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }
}