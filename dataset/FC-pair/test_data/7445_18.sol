contract c7445{
  // set all the dates
  function setIcoDates(
                  uint256 _startIcoPreICO,
                  uint256 _startIcoPreICO2ndRound,
                  uint256 _endIcoPreICO,
                  uint256 _startIcoMainSale,
                  uint256 _endIcoMainSale
    ) public onlyOwner  { 
    // Enforce consistency of dates
    require(_startIcoPreICO < _startIcoPreICO2ndRound);
    require(_startIcoPreICO2ndRound < _endIcoPreICO);
    require(_endIcoPreICO <= _startIcoMainSale);
    require(_startIcoMainSale < _endIcoMainSale);
    // Once Pre-ICO has started, none of the dates can be moved anymore.
    require(now < startIcoPreICO); 
	  startIcoPreICO   = _startIcoPreICO;
	  startIcoPreICO2ndRound = _startIcoPreICO2ndRound;
    endIcoPreICO = _endIcoPreICO;
    startIcoMainSale = _startIcoMainSale;
	  endIcoMainSale = _endIcoMainSale;
  }
}