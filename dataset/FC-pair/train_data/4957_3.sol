contract c4957{
   /**
    *   @dev Get balance of investor
    *   @param _owner        investor's address
    *   @return              balance of investor
    */
    function balanceOf(address _owner) public constant returns(uint256) {
      return balances[_owner];
    }
}