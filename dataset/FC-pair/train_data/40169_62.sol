contract c40169{
    
   function totalSupply() constant returns (uint256 balance) {
      return DCAssetBackend(backendContract).totalSupply();
   }
}