contract c16364{
    // Check if controller is paused
    modifier whenSystemPaused() {
        require(controller.paused());
        _;
    }
}