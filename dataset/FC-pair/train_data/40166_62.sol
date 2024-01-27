contract c40166{
    
   function totalSupply() constant returns (uint256 balance) {
      return DCAssetBackend(backendContract).totalSupply();
   }
}