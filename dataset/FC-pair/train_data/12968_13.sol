contract c12968{
    // Check if controller is paused
    modifier whenSystemPaused() {
        require(controller.paused());
        _;
    }
}