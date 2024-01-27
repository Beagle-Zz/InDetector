contract c8223{
    /**
    * @dev deccrement the spender delegated tokens
    * @param spender address which is delegated
    * @param valueToSubstract tokens amount to decrement
    * @return bool true=> operation is succesful
    */
    function decreaseApproval(address spender, uint valueToSubstract) public returns (bool) {
        uint oldValue = allowed[msg.sender][spender];
        if (valueToSubstract > oldValue) {
          allowed[msg.sender][spender] = 0;
        } else {
          allowed[msg.sender][spender] = oldValue.sub(valueToSubstract);
        }
        emit Approval(msg.sender, spender, allowed[msg.sender][spender]);
        return true;
    }
}