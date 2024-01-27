contract c12705{
    /**
     * @notice Checks how much a certain user allowed to a different one.
     **/
    function allowance(address _owner, address _spender) public view returns (uint256){
        return allowed[_owner][_spender];
    }
}