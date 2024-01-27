contract c40183{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}