contract c8135{
    /**
     * @dev Modifier throws if called by any account other than the pendingOwner.
     */
    modifier onlyPendingOwner() {
        require(isOwnershipTransferActive);
        require(msg.sender == pendingOwner, "Only nominated pretender can do that.");
        _;
    }
}