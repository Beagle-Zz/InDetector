contract c8578{
    /**
     * @dev Allows for a migration request to be created, all migrations requests
     * are timelocked by 7 days.
     *
     * @param destination   The destination to send the ether to.
     */
    function requestForMigration(address destination) public onlyOwner {
        hasRequestedForMigration = true;
        requestedForMigrationAt = now;
        migrationDestination = destination;
        emit MigrateFundsRequested(msg.sender, destination);
    }
}