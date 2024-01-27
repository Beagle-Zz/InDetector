contract c2883{
    /// @dev ability for controller to step down
    function detachController() external onlyController {
        address was = m_controller;
        m_controller = address(0);
        ControllerRetired(was);
    }
}