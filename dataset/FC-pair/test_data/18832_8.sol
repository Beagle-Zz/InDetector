contract c18832{
    /**
    * @dev Function to stop minting new tokens.
    * @return True if the operation was successful.
    */
    function finishMinting() public onlyOwner returns (bool)  {
        mintingFinished = true;
        MintFinished();
        return true;
    }
}