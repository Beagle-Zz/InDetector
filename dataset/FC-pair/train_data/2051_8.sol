contract c2051{
    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param _owner address The address which owns the funds.
     * @param _spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address _owner, address _spender) view public returns(uint256)
    {
        require(msg.sender==_owner || msg.sender == _spender || msg.sender==getOwner());
        return allowed[_owner][_spender];
    }
}