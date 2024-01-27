contract c40181{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}