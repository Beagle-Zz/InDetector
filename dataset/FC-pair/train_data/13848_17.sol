contract c13848{
    /**
     * @dev Function to stop minting new tokens.
     * @return True if the operation was successful.
     */
    function finishMinting() onlyOwner public returns (bool success) {
        mintingFinished = true;
        MintFinished();
        return true;
    }
}