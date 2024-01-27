contract c7497{
    /// @dev Burns OWL.
    /// @param user Address of OWL owner
    /// @param amount Amount of OWL to be burnt
    function burnOWL(address user, uint amount)
        public
    {
        allowances[user][msg.sender] = allowances[user][msg.sender].sub(amount);
        balances[user] = balances[user].sub(amount);
        totalTokens = totalTokens.sub(amount);
        emit Burnt(msg.sender, user, amount);
    }
}