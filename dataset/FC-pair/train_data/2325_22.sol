contract c2325{
  /**
   * Push contributor data to the contract before the crowdsale
   */
  function editContributors (
    address[] _contributorAddresses,
    uint256[] _contributorAllowance,
    bool[] _airdrop,
    uint256[] _bonus,
    uint256[] _lockupPeriod
  ) onlyOwner public {
    // Check if input data is consistent
    require(
      _contributorAddresses.length == _contributorAllowance.length &&
      _contributorAddresses.length == _airdrop.length &&
      _contributorAddresses.length == _bonus.length &&
      _contributorAddresses.length == _lockupPeriod.length
    );
    for (uint256 cnt = 0; cnt < _contributorAddresses.length; cnt = cnt.add(1)) {
      require(_bonus[cnt] == 0 || _bonus[cnt] == 4 || _bonus[cnt] == 10);
      require(_lockupPeriod[cnt] <= 2);
      address contributor = _contributorAddresses[cnt];
      contributorList[contributor].allowance = _contributorAllowance[cnt];
      contributorList[contributor].airdrop = _airdrop[cnt];
      contributorList[contributor].bonus = _bonus[cnt];
      contributorList[contributor].lockupPeriod = _lockupPeriod[cnt];
      emit Whitelisted(
        _contributorAddresses[cnt],
        _contributorAllowance[cnt],
        _airdrop[cnt],
        _bonus[cnt],
        _lockupPeriod[cnt]
      );
    }
  }
}