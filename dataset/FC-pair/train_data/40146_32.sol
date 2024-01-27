contract c40146{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}