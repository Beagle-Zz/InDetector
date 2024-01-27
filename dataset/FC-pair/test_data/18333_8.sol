contract c18333{
    /// @dev Ends the funding period and sends the ETH home
    function finalize() external onlyOwner {
      require (isFinalized == false);
      require(msg.sender == owner); // Allstocks double chack  
      require(_totalSupply >= tokenCreationMin + allstocksFund);  // have to sell minimum to move to operational
      require(_totalSupply > 0);
      if (now < fundingEndTime) {    //if try to close before end time, check that we reach target
        require(_totalSupply >= tokenCreationCap);
      }
      else 
        require(now >= fundingEndTime);
	    // move to operational
      isFinalized = true;
      ethFundDeposit.transfer(this.balance);  // send the eth to Allstocks
    }
}