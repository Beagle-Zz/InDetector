contract c10970{
    // called by the owner to unpause, returns to normal state
    function unpause() mostOwner(keccak256(msg.data)) whenPaused public {
        paused = false;
        Unpause();
    }
}