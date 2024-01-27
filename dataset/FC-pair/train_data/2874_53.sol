contract c2874{
    /// @notice withdraw tokens if ico failed
    /// @param _to address to send tokens to
    /// @param _amount amount of tokens in token-wei
    function withdrawTokens(address _to, uint _amount)
        external
        validAddress(_to)
        requiresState(IcoState.FAILED)
        onlymanyowners(keccak256(msg.data))
    {
        require((_amount > 0) && (m_token.balanceOf(this) >= _amount));
        m_token.transfer(_to, _amount);
    }
}