contract c40083{
   
   function approve(address _spender, uint256 _amount) returns (bool success) {
      if (!DVIPBackend(backendContract).approve(msg.sender, _spender, _amount)) throw;
      Approval(msg.sender, _spender, _amount);
      return true;
   }
}