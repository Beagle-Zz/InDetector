contract c7516{
    /**
     * Sender allows another wallet to `transferFrom` tokens from their wallet.
     * @param _spender Address of `transferFrom` recipient.
     * @param _value Number of tokens to `transferFrom`.
     * @return True if the approval succeeded.
     */
    function approve(address _spender, uint _value)
        public
        returns (bool success)
    {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}