contract c40147{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}