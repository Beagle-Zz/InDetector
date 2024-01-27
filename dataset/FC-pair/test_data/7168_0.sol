contract c7168{
    // Minting can only happen when minting is not finished
    modifier canMint() {
      require(!mintingFinished);
      _;
    }
}