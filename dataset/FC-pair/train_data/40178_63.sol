contract c40178{
   
   function transfer(address _to, uint256 _amount) returns (bool success)  {
      if (!DCAssetBackend(backendContract).transfer(msg.sender, _to, _amount)) throw;
      Transfer(msg.sender, _to, _amount);
      return true;
   }
}