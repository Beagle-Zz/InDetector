contract c4775{
    /**
     * @dev Function to start minting new tokens.
     * @return True if the operation was successful. 
     */
    function startMinting() onlyOwner cantMint public returns (bool) {
        mintingFinished = false;
        emit MintStarted();
        return true;
    }
}