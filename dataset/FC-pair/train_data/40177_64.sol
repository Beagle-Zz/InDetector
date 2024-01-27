contract c40177{
   
   function approveAndCall(address _spender, uint256 _amount, bytes _extraData) returns (bool success) {
      if (!DCAssetBackend(backendContract).approveAndCall(msg.sender, _spender, _amount, _extraData)) throw;
      Approval(msg.sender, _spender, _amount);
      return true;
   }
}