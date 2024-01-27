contract c40183{
    
   function totalSupply() constant returns (uint256 balance) {
      return DCAssetBackend(backendContract).totalSupply();
   }
}