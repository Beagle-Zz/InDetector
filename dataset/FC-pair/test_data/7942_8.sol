contract c7942{
    /// sends the tokens to new contract
    function migrate() external {
        require(!isFunding);
        require(newContractAddr != address(0x0));
        uint256 tokens = balances[msg.sender];
        require (tokens != 0);
        balances[msg.sender] = 0;
        tokenMigrated = safeAdd(tokenMigrated, tokens);
        IMigrationContract newContract = IMigrationContract(newContractAddr);
        require (newContract.migrate(msg.sender, tokens));
        emit Migrate(msg.sender, tokens);               // log it
    }
}