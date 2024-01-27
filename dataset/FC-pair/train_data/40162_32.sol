contract c40162{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}