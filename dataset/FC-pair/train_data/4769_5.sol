contract c4769{
    /* Checks how much _spender can withdraw from _owner */
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}