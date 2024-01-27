contract c40173{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}