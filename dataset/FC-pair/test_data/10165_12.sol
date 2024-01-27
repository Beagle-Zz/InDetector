contract c10165{
  /**
   * @notice add new release record for beneficiary
   */
  function lock(address _beneficiary, bool _isStraight, uint[] _releaseTimes, uint[] _releaseRatios)
    external
    onlyOwner
    onlyState(State.Init)
    onlyBeneficiary(_beneficiary)
  {
    require(!locked[_beneficiary]);
    require(_releaseRatios.length != 0);
    require(_releaseRatios.length == _releaseTimes.length);
    uint i;
    uint len = _releaseRatios.length;
    // finally should release all tokens
    require(_releaseRatios[len - 1] == coeff);
    // check two array are ascending sorted
    for(i = 0; i < len - 1; i++) {
      require(_releaseTimes[i] < _releaseTimes[i + 1]);
      require(_releaseRatios[i] < _releaseRatios[i + 1]);
    }
    // 2 release times for straight locking type
    if (_isStraight) {
      require(len == 2);
    }
    numLocks = numLocks.add(1);
    // create Release for the beneficiary
    releases[_beneficiary].isStraight = _isStraight;
    // copy array of uint
    releases[_beneficiary].releaseTimes = _releaseTimes;
    releases[_beneficiary].releaseRatios = _releaseRatios;
    // lock beneficiary
    locked[_beneficiary] = true;
    emit Locked(_beneficiary, _isStraight);
    //  if all beneficiaries locked, change Locker state to change
    if (numLocks == numBeneficiaries) {
      state = State.Ready;
      emit StateChanged(state);
    }
  }
}