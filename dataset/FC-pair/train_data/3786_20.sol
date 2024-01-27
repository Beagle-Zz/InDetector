contract c3786{
    // Additions for Bankroll
    function whiteListContract(address contractAddress)
        public
        isAnOwner
        contractIsNotWhiteListed(contractAddress)
        notNull(contractAddress)
    {
        isWhitelisted[contractAddress] = true;
        whiteListedContracts.push(contractAddress);
        // We set the daily tokens for a particular contract in a separate call.
        dailyTokensPerContract[contractAddress] = 0;
        emit WhiteListAddition(contractAddress);
    }
}