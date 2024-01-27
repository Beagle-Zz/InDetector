contract c12968{
    // Check if sender is controller
    modifier onlyController() {
        require(msg.sender == address(controller));
        _;
    }
}