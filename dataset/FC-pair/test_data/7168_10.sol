contract c7168{
    // ------------------------------------------------------------------------
    // Owner can remove the ability to mint new coins
    // ------------------------------------------------------------------------
    function finishMinting() onlyOwner canMint public returns (bool) {
      mintingFinished = true;
      emit MintingFinished();
      return true;
    }
}