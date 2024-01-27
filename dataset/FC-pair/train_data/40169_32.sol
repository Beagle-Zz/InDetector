contract c40169{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}