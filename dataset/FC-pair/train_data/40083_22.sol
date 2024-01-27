contract c40083{
    
   function totalSupply() constant returns (uint256 balance) {
      return DVIPBackend(backendContract).totalSupply();
   }
}