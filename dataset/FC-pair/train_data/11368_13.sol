contract c11368{
    /**
     * @dev Function to stop minting new tokens.
     * @return True if the operation was successful.
     */
    function finishMinting() canMint onlyMinter external returns (bool) {
        mintingFinished = true;
        MintingFinished();
        return true;
    }
}