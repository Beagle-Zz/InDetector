contract c14884{
    /**
    * @dev Function to stop minting new tokens.
    */
    function finishMinting() public onlyOwner returns (bool) {
        mintingFinished = true;
        MintFinished();
        return true;
    }
}