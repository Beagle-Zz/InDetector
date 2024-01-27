contract c2883{
    /// @dev sets the controller
    function setController(address _controller) external onlymanyowners(keccak256(msg.data)) {
        require(m_attaching_enabled);
        m_controller = _controller;
        ControllerSet(m_controller);
    }
}