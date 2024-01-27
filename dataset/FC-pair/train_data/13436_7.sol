contract c13436{
    /**
     * @dev Add new beneficiary to start vesting
     * @param _beneficiary address of the beneficiary to whom vested tokens are transferred
     * @param _start time in seconds which the tokens will vest
     * @param _cliff time in seconds of the cliff in which tokens will begin to vest
     * @param _duration duration in seconds of the period in which the tokens will vest
     * @param _revocable whether the vesting is revocable or not
     */
    function addBeneficiary(address _beneficiary, uint256 _vested, uint256 _start, uint256 _cliff, uint256 _duration, bool _revocable, string _description)
    onlyOwner
    isNotBeneficiary(_beneficiary)
    public {
        require(_beneficiary != address(0));
        require(_cliff >= _start);
        require(token.balanceOf(this) >= totalVested.sub(totalReleased).add(_vested));
        beneficiaries[_beneficiary] = Beneficiary({
            released : 0,
            vested : _vested,
            start : _start,
            cliff : _cliff,
            duration : _duration,
            revoked : false,
            revocable : _revocable,
            isBeneficiary : true,
            description : _description
            });
        totalVested = totalVested.add(_vested);
        addresses.push(_beneficiary);
        emit NewBeneficiary(_beneficiary);
    }
}