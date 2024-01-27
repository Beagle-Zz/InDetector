contract c40149{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}