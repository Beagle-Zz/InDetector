contract c13436{
    /**
     * @dev Calculates the amount that has already vested but hasn't been released yet.
     * @param _beneficiary Beneficiary address
     */
    function releasableAmount(address _beneficiary) public view returns (uint256) {
        return vestedAmount(_beneficiary).sub(beneficiaries[_beneficiary].released);
    }
}