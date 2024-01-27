contract c16630{
    /**
    * @dev Function to check the amount of tokens that an owner allowed to a spender.
    * @param _holder address The address which owns the funds.
    * @param _spender address The address which will spend the funds.
    * @return A uint256 specifying the amount of tokens still available for the spender.
    */
    function allowance(address _holder, address _spender) public view returns (uint256) {
        return _allowed[_holder][_spender];
    }
}