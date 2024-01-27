contract c2883{
    /// @notice owners: send `value` of ether to address `to`, can be called if crowdsale succeeded
    /// @param to where to send ether
    /// @param value amount of wei to send
    function sendEther(address to, uint value)
        external
        validAddress(to)
        onlymanyowners(keccak256(msg.data))
        requiresState(State.SUCCEEDED)
    {
        require(value > 0 && this.balance >= value);
        to.transfer(value);
        EtherSent(to, value);
    }
}