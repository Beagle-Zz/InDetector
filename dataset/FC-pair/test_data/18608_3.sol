contract c18608{
    /**
     * Permanently lock out the director to decentralize Oyster
     * Invocation is discretionary because Oyster might be better suited to
     * transition to an artificially intelligent smart contract director
     */
    function selfLock() public payable onlyDirector {
        // Prevents accidental lockout
        require(msg.value == 10 ether);
        // Permanently lock out the director
        directorLock = true;
    }
}