contract c16373{
    // Check if controller is paused
    modifier whenSystemPaused() {
        require(controller.paused());
        _;
    }
}