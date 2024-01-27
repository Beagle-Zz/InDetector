contract c7516{
    /**
     * Transfer tokens from any wallet to the `_to` wallet. This only works if
     *     the `_from` wallet has already allocated tokens for the caller wallet
     *     using `approve`. The from wallet must have sufficient balance to
     *     transfer. The caller must have sufficient allowance to transfer.
     * @param _from Wallet address that tokens are withdrawn from.
     * @param _to Wallet address that tokens are deposited to.
     * @param _value Number of tokens transacted.
     * @return True if the transfer succeeded.
     */
    function transferFrom(address _from, address _to, uint _value)
        public
        returns (bool success)
    {
        balances[_from] = balances[_from].sub(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(_from, _to, _value);
        return true;
    }
}