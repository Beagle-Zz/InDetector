contract c40161{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}