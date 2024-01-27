contract c12677{
    /**
     * @dev New owner can accpet ownership.
     */
    function claimOwnership() public onlyPendingOwner {
        emit LogOwnerShipTransferred(owner, pendingOwner);
        owner = pendingOwner;
        pendingOwner = address(0);
    }
}