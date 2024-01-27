contract c2583{
    /**
     * tokens balance
     *
     * Get `_owner` tokens
     *
     * @param _owner The address 
     */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balanceOf[_owner];
    }
}