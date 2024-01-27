contract c40182{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}