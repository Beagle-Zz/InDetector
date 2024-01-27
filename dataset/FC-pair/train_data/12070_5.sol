contract c12070{
    /* Returns the amount of tokens approved by the owner */
    /* that can be transferred by spender */
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }
}