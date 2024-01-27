contract c40180{
    
    
   function balanceOf(address _address) constant returns (uint256 balance) {
      return DCAssetBackend(backendContract).balanceOf(_address);
   }
}