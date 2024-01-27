contract c13436{
    /**
     * @notice Transfers vested tokens to beneficiary.
     * @param _beneficiary Beneficiary address
     */
    function release(address _beneficiary) private
    isBeneficiary(_beneficiary)
    {
        Beneficiary storage beneficiary = beneficiaries[_beneficiary];
        uint256 unreleased = releasableAmount(_beneficiary);
        require(unreleased > 0);
        beneficiary.released = beneficiary.released.add(unreleased);
        totalReleased = totalReleased.add(unreleased);
        token.transfer(_beneficiary, unreleased);
        if ((beneficiary.vested - beneficiary.released) == 0) {
            beneficiary.isBeneficiary = false;
        }
        emit Released(_beneficiary, unreleased);
    }
}