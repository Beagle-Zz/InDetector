contract c16365{
    // Check if controller is paused
    modifier whenSystemPaused() {
        require(controller.paused());
        _;
    }
}