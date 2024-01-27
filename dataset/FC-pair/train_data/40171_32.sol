contract c40171{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}