contract c8223{
    /**
    * @dev increment the spender delegated tokens
    * @param spender address which is delegated
    * @param valueToAdd tokens amount to increment
    * @return bool true=> operation is succesful
    */
    function increaseApproval(address spender, uint valueToAdd) public returns (bool) {
        allowed[msg.sender][spender] = allowed[msg.sender][spender].add(valueToAdd);
        emit Approval(msg.sender, spender, allowed[msg.sender][spender]);
        return true;
    }
}