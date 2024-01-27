contract c10639{
    /**
    * @dev Decrease the amount of tokens that an owner allowed to a spender
    *
    * @param _spender The address which will spend the funds
    * @param _value The amount of tokens to decrease the allowance by
    * @return Whether the approval was successful or not
    */
    function decreaseApproval(address _spender, uint _value) onlyPayloadSize(64) public returns (bool) {
        require(_value > 0);
        uint256 value = allowed[msg.sender][_spender];
        if (_value >= value) {
            allowed[msg.sender][_spender] = 0;
        } else {
            allowed[msg.sender][_spender] = value.sub(_value);
        }
        emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
        return true;
    }
}