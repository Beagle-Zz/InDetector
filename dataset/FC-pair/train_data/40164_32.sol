contract c40164{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}