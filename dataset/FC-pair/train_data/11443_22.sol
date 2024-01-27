contract c11443{
  // get sum of array values
  function arraySum(uint256[] _amount) internal pure returns(uint256){
    uint256 totalAmount;
    for(uint i;i < _amount.length;i++){
      totalAmount = totalAmount.add(_amount[i]);
    }
    return totalAmount;
  }
}