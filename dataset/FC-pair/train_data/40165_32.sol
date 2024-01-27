contract c40165{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}