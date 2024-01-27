contract c2166{
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
        uint64 _start,
        uint64 _cliff,
        uint64 _vesting,
        bool _revokable,
        bool _burnsOnRevoke
    ) public {
        // Check for date inconsistencies that may cause unexpected behavior
        require(_cliff >= _start && _vesting >= _cliff);
        require(tokenGrantsCount(_to) < MAX_GRANTS_PER_ADDRESS);   // To prevent a user being spammed and have his balance locked (out of gas attack when calculating vesting).
        uint256 count = grants[_to].push(
            TokenGrant(
                _revokable ? msg.sender : 0, // avoid storing an extra 20 bytes when it is non-revokable
                _value,
                _cliff,
                _vesting,
                _start,
                _revokable,
                _burnsOnRevoke
            )
        );
        transfer(_to, _value);
        NewTokenGrant(msg.sender, _to, _value, count - 1);
    }
}