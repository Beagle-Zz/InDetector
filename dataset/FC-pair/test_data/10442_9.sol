contract c10442{
    // This function allows someone to withdraw tokens from someone's address
    // For this to work, the person needs to have been approved by the account owner (via the approve function)
    function transferFrom(address _from, address _to, uint256 _value) canTransfer(_to) public returns (bool)
    {
        // Check that function caller has been approved to withdraw tokens
        require(_value <= allowed[_from][msg.sender]);
        // Call out base transfer method
        transferBasic(_from, _to, _value);
        // Subtract withdrawn tokens from allowance
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        return true;
    }
}