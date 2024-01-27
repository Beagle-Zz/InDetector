contract c40174{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}