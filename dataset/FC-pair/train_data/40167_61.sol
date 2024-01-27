contract c40167{
    
    
   function balanceOf(address _address) constant returns (uint256 balance) {
      return DCAssetBackend(backendContract).balanceOf(_address);
   }
}