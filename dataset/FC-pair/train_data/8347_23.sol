contract c8347{
    /**
    * @dev Function to stop minting new tokens.
    * @return True if the operation was successful.
    */
    function finishMinting() onlyOwner canMint whenNotPaused public returns (bool) {
        return super.finishMinting();
    }
}