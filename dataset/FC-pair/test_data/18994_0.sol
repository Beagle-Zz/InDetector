contract c18994{
  /// @dev Called by a crowdsale contract upon creation.
  /// @param self Stored crowdsale from crowdsale contract
  /// @param _owner Address of crowdsale owner
  /// @param _saleData Array of 2 item sets such that, in each 2 element
  /// set, 1 is timestamp, and 2 is price in tokens/ETH at that time
  /// @param _endTime Timestamp of sale end time
  /// @param _percentBurn Percentage of extra tokens to burn
  /// @param _token Token being sold
  function init(DirectCrowdsaleStorage storage self,
                address _owner,
                uint256[] _saleData,
                uint256 _endTime,
                uint8 _percentBurn,
                CrowdsaleToken _token)
                public
  {
    require(self.owner == 0);
    require(_saleData.length > 0);
    require((_saleData.length%2) == 0); // ensure saleData is 2-item sets
    require(_saleData[0] > (now + 2 hours));
    require(_endTime > _saleData[0]);
    require(_owner > 0);
    require(_percentBurn <= 100);
    self.owner = _owner;
    self.startTime = _saleData[0];
    self.endTime = _endTime;
    self.token = _token;
    self.percentBurn = _percentBurn;
    uint256 _tempTime;
    for(uint256 i = 0; i < _saleData.length; i += 2){
      require(_saleData[i] > _tempTime);
      require(_saleData[i + 1] > 0);
      self.milestoneTimes.push(_saleData[i]);
      self.tokenPrice[_saleData[i]] = _saleData[i + 1];
      _tempTime = _saleData[i];
    }
    self.tokensPerEth = _saleData[1];
  }
}