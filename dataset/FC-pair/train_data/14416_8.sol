contract c14416{
    /* ### MODIFIERS ### */
    // Only the contract owner can call these methods
    modifier ownerOnly() {
        require(owner == msg.sender);
        _;
    }
}