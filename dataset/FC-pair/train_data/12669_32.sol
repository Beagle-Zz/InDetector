contract c12669{
  // Allow the contract to approve the mint restart 
  // (Voting will be essential in these actions)
  function restartMinting() onlyContract cantMint public returns (bool) {
    mintingFinished = false;
    MintRestarted(); // Notify the blockchain that the coin minting was restarted
    return true;
  }
}