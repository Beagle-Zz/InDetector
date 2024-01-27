contract c8358{
    /**
     * @dev Grant tokens to a specified address
     * @param _to address The address which the tokens will be granted to.
     * @param _value uint256 The amount of tokens to be granted.
     * @param _start uint64 Time of the beginning of the grant.
     * @param _cliff uint64 Time of the cliff period.
     * @param _vesting uint64 The vesting period.
     */
    function grantVestedTokens(
        address _to,
        uint256 _value,
        uint _start,
        uint _cliff,
        uint _vesting,
        bool _revokable,
        bool _burnsOnRevoke,
        bool _timeOrNumber
    ) public returns (bool) {
        // Check for date inconsistencies that may cause unexpected behavior
        if (_cliff < _start || _vesting < _cliff) {
            revert();
        }
        // To prevent a user being spammed and have his balance locked (out of gas attack when calculating vesting).
        if (tokenGrantsCount(_to) > MAX_GRANTS_PER_ADDRESS) revert();
        uint count = grants[_to].push(
            TokenGrant(
                _revokable ? msg.sender : 0, // avoid storing an extra 20 bytes when it is non-revokable
                _value,
                _start,
                _cliff,
                _vesting,
                _revokable,
                _burnsOnRevoke,
                _timeOrNumber
            )
        );
        transfer(_to, _value);
        emit NewTokenGrant(msg.sender, _to, _value, count - 1);
        return true;
    }
}