contract c11492{
    /**
     * @dev Function to check the amount of tokens that an owner allowed jto a spender. 
     */
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }
}