contract c40163{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}