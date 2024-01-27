contract c40166{
   
   modifier onlyAsset() {
    assert(msg.sender == assetAddress);
    _;
   }
}