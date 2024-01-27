contract c40172{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}