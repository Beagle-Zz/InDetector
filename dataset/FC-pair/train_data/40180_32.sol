contract c40180{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}