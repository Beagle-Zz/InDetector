contract c40148{
   
   modifier onlyAsset {
    assert(msg.sender == assetAddress);
    _;
   }
}