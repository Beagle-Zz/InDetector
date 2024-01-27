contract c4200{
    // there is no way to revert that
    function startMigration() public onlyMigration {
        require(false == migrationStarted);
        migrationStarted = true;
    }
}