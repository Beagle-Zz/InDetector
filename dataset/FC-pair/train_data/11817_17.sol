contract c11817{
    /**
     * @dev Override so that minting cannot be accidentally terminated
     */
    function finishMinting() onlyOwner canMint public returns (bool) {
        return false;
    }
}