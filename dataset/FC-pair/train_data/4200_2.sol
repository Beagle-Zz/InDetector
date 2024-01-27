contract c4200{
    // there is no way to revert that
    function finishMigration() public onlyMigration {
        require(true == migrationStarted);
        migrationFinished = true;
    }
}