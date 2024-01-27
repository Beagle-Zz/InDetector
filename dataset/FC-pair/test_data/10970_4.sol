contract c10970{
    // called by the owner to pause, triggers stopped state
    function pause() mostOwner(keccak256(msg.data)) whenNotPaused public {
        paused = true;
        Pause();
    }
}