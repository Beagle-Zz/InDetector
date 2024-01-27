contract c10639{
    /**
    * @dev Function to check the amount of tokens that an owner allowed to a spender
    *
    * @param _owner The address of the account owning tokens
    * @param _spender The address of the account able to transfer the tokens
    * @return Amount of remaining tokens allowed to spent
    */
    function allowance(address _owner, address _spender) onlyPayloadSize(64) public view returns (uint256) {
        return allowed[_owner][_spender];
    }
}