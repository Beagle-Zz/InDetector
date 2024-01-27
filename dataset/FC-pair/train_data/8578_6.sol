contract c8578{
    /**
     * @dev Cancels a migration
     */
    function cancelMigration() public onlyOwner hasNotSuicided {
        hasRequestedForMigration = false;
        requestedForMigrationAt = 0;
        emit MigrateFundsCancelled(msg.sender);
    }
}