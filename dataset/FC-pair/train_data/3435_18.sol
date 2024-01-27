contract c3435{
  /**
   * @dev Function to stop minting new tokens.
   * @return True if the operation was successful.
   */
    function finishMinting() public hasMintPermission canMint returns (bool) {
        mintingFinished = true;
        emit MintFinished();
        return true;
    }
}