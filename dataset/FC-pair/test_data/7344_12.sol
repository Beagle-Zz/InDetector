contract c7344{
    /**
     * @dev Function to stop minting new tokens.
     */
    function finishMinting() onlyOwner canMint public returns (bool) {
      mintingFinished = true;
      MintFinished();
      return true;
    }
}