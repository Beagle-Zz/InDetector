contract c13330{
    // Reissue your tokens.
    function migrate() public
    {
        require(balances[msg.sender] > 0);
        migrateInternal(msg.sender);
    }
}