contract c40178{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}