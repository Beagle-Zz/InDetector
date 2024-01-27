contract c3786{
    // Remove a whitelisted contract. This is an exception to the norm in that
    // it can be invoked directly by any owner, in the event that a game is found
    // to be bugged or otherwise faulty, so it can be shut down as an emergency measure.
    // Iterates through the whitelisted contracts to find contractAddress,
    //  then swaps it with the last address in the list - then decrements length
    function deWhiteListContract(address contractAddress)
        public
        isAnOwner
        contractIsWhiteListed(contractAddress)
    {
        isWhitelisted[contractAddress] = false;
        for (uint i=0; i < whiteListedContracts.length - 1; i++)
            if (whiteListedContracts[i] == contractAddress) {
                whiteListedContracts[i] = owners[whiteListedContracts.length - 1];
                break;
            }
        whiteListedContracts.length -= 1;
        emit WhiteListRemoval(contractAddress);
    }
}