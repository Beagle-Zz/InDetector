contract c12502{
    /**
     * @dev Main means of adding information about beneficiaries who should have tokens vested for them.
     * We add users in array to save gas for such operation.
     * @param _beneficiaries user addresses array whose tokens need to be vested.
     * @param _amounts amount of tokens for vesting array which is related to the user with same idx.
     **/
    function addVestingForBeneficiaries(
        address[] _beneficiaries,
        uint256[] _amounts
    ) public onlyRole(UTILITY_ROLE) whenNotPaused {
        require(_beneficiaries.length == _amounts.length);
        for (uint i = 0; i < _beneficiaries.length; i++) {
            addVestingForBeneficiary(_beneficiaries[i], _amounts[i]);
        }
    }
}