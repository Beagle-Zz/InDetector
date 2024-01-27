contract c40150{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}