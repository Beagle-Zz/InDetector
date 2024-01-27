contract c40168{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}