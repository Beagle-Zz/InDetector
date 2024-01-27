contract c40177{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}