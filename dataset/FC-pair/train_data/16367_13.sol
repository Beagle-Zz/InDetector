contract c16367{
    // Check if controller is paused
    modifier whenSystemPaused() {
        require(controller.paused());
        _;
    }
}