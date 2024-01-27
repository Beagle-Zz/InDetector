contract c16364{
    // Check if sender is controller
    modifier onlyController() {
        require(msg.sender == address(controller));
        _;
    }
}