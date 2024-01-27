contract c4187{
 /**
   * @dev Set internal allocation 
   *  _buyer The adress of the buyer
   *  _tokenAmount Amount Allocated tokens + 18 decimals
   */
  function _setAllocation (address _buyer, uint256 _tokenAmount) internal{
      if(!buyers[_buyer]){
        //Add buyer to buyers list 
        buyers[_buyer] = true;
        //Add _buyer to addresses list
        addresses.push(_buyer);
        //Reset buyer allocation
        allocationsTotal[_buyer] = 0;
      }  
      //Add tokens to buyers allocation
      allocationsTotal[_buyer]  = allocationsTotal[_buyer].add(_tokenAmount); 
      //Spilt amount in 3
      uint256 splitAmount = allocationsTotal[_buyer].div(3);
      uint256 diff        = allocationsTotal[_buyer].sub(splitAmount+splitAmount+splitAmount);
      //Sale steps
      allocations1[_buyer]   = splitAmount;            // step 1 
      allocations2[_buyer]   = splitAmount;            // step 2
      allocations3[_buyer]   = splitAmount.add(diff);  // step 3 + diff
      //Logg Allocation
      emit LogNewAllocation(_buyer, _tokenAmount);
  }
}