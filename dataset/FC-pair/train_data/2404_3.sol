contract c2404{
    /**
     * Returns the amount which _spender is still allowed to withdraw from _owner
     */
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}