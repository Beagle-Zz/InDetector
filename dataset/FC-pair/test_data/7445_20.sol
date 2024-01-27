contract c7445{
  // testable method
  function getRateIcoWithBonusByDate(uint256 _date) public view returns (uint256) {
    uint256 bonus;
	  uint256 rateICO;
    //icoPreICO   
    if (_date >= startIcoPreICO && _date < endIcoPreICO){
      rateICO = rateIcoPreICO;
    }  
    //icoMainSale   
    if (_date >= startIcoMainSale  && _date < endIcoMainSale){
      rateICO = rateIcoMainSale;
    }  
    // bonus
    // Note: Multiplying percentages with 10, later dividing by 1000 instead of 100
    // This deals with our 0.2% daily decrease. 
    if (_date >= startIcoPreICO && _date < startIcoPreICO2ndRound){
      bonus = 300; // 30% * 10
    } else if (_date >= startIcoPreICO2ndRound && _date < endIcoPreICO){
      bonus = 200; // 20% * 10
    } else if (_date >= startIcoMainSale) {
      // note: 86400 seconds in a day, decrease by 0.2% daily
      uint256 daysSinceMainIcoStarted = (_date - startIcoMainSale) / 86400;
      bonus = 100 - (2 * daysSinceMainIcoStarted); // 10% - 0.2 per day * 10
      if (bonus < 0) { // safety - all the dates can be changed
        bonus = 0;
      }
    }
    return rateICO + rateICO.mul(bonus).div(1000);
  }    
}