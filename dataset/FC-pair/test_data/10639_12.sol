contract c10639{
    /**
    * @dev Increase the amount of tokens that an owner allowed to a spender
    *
    * @param _spender The address which will spend the funds
    * @param _value The amount of tokens to increase the allowance by
    * @return Whether the approval was successful or not
    */
    function increaseApproval(address _spender, uint _value) onlyPayloadSize(64) public returns (bool) {
        require(_value > 0);
        allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_value);
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}