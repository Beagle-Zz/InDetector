contract c4703{
    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param _owner Address The address which owns the funds.
     * @param _spender Address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address _owner, address _spender) external constant returns (uint256 remaining) {
        return allowance[_owner][_spender];
    }
}