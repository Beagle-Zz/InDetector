contract c3486{
  /**
  * @dev Function to stop minting new tokens.
  * @return True if the operation was successful.
  */
  function finishMinting() onlyOwner canMint public returns (bool) {
    mintingFinished = true;
    MintFinished();
    return true;
  }
}