contract c14253{
    /**
     * @dev Function to stop minting new tokens.
     * @return True if the operation was successful.
     */
    function finishMinting() public onlyMintAgent canMint returns (bool) {
        mintingFinished = true;
        emit MintFinished();
        return true;
    }
}