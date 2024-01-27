contract c18333{
    /// @dev Allows contributors to recover their ether in the case of a failed funding campaign.
    function refund() external {
      require (isFinalized == false);  // prevents refund if operational
      require (isActive == true);
      require (now > fundingEndTime); // prevents refund until sale period is over
      require(_totalSupply < tokenCreationMin + allstocksFund);  // no refunds if we sold enough
      require(msg.sender != owner); // Allstocks not entitled to a refund
      uint256 allstocksVal = balances[msg.sender];
      uint256 ethValRefund = refunds[msg.sender];
      require(allstocksVal > 0);   
      require(ethValRefund > 0);  
      balances[msg.sender] = 0;
      refunds[msg.sender] = 0;
      _totalSupply = _totalSupply.sub(allstocksVal); // extra safe
      uint256 ethValToken = allstocksVal / tokenExchangeRate;     // should be safe; previous throws covers edges
      require(ethValRefund <= ethValToken);
      msg.sender.transfer(ethValRefund);                 // if you're using a contract; make sure it works with .send gas limits
      LogRefund(msg.sender, ethValRefund);               // log it
    }
}