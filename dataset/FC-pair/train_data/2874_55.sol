contract c2874{
    /// @notice set non ether investment controller
    function setNonEtherController(address _controller)
        external
        validAddress(_controller)
        timedStateChange(address(0), 0, true)
        onlymanyowners(keccak256(msg.data))
    {
        m_nonEtherController = _controller;
    }
}