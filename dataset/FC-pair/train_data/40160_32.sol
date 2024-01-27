contract c40160{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}