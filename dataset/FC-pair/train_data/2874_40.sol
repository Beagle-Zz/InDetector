contract c2874{
    /// @notice owners: send `value` of tokens to address `to`, can be called if
    ///         crowdsale failed and some of the investors refunded the ether
    /// @param to where to send tokens
    /// @param value amount of token-wei to send
    function sendTokens(address to, uint value)
        external
        validAddress(to)
        onlymanyowners(keccak256(msg.data))
        requiresState(State.REFUNDING)
    {
        require(value > 0 && m_token.balanceOf(this) >= value);
        m_token.transfer(to, value);
    }
}