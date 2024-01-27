contract c3291{
    /// @dev Calculate amount of vested tokens at a specifc time.
    /// @param _grant Grant The vesting grant.
    /// @param _time uint256 The time to be checked
    /// @return a uint256 Representing the amount of vested tokens of a specific grant.
    function calculateVestedTokens(Grant _grant, uint256 _time) private constant returns (uint256) {
        // If we're before the cliff, then nothing is vested.
        if (_time < _grant.cliff) {
            return _grant.prevested;
        }
        // If we're after the end of the vesting period - everything is vested;
        if (_time >= _grant.end) {
            return _grant.value;
        }
        // Calculate amount of installments past until now.
        uint256 installmentsPast = _time.sub(_grant.cliff).div(_grant.installmentLength) + 1;
        // Calculate and return installments that have passed according to vesting days that have passed.
        return _grant.prevested.add(_grant.value.mul(installmentsPast.mul(_grant.vestingPercentage)).div(100));
    }
}