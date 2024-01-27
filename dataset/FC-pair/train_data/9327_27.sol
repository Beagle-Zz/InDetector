contract c9327{
    /// @dev Mints OWL.
    /// @param to Address to which the minted token will be given
    /// @param amount Amount of OWL to be minted
    function mintOWL(address to, uint amount)
        public
    {
        require(minter != 0 && msg.sender == minter);
        balances[to] = balances[to].add(amount);
        totalTokens = totalTokens.add(amount);
        emit Minted(to, amount);
    }
}