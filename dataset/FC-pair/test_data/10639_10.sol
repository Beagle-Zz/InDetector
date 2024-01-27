contract c10639{
    /**
    * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender
    * To prevent attack described in https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729, 
    * approve is not allowed when the allowance of specified spender is not zero, call increaseApproval 
    * or decreaseApproval to change an allowance
    *
    * @param _spender The address of the account able to transfer the tokens
    * @param _value The amount of wei to be approved for transfer
    * @return Whether the approval was successful or not
    */
    function approve(address _spender, uint256 _value) onlyPayloadSize(64) public returns (bool) {
        require(_value > 0);
        require(allowed[msg.sender][_spender] == 0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}