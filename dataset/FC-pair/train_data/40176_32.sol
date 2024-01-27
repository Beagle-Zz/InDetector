contract c40176{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}