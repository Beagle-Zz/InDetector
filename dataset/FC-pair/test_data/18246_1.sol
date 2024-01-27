contract c18246{
      // What is the balance of a particular account?
      function balanceOf(address _owner) constant returns (uint256 balance) {
         return balances[_owner];
      }
}