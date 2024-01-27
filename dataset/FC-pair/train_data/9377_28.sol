contract c9377{
    /**
     * @dev Calculates the amount that has already vested but hasn't been released yet.
     * @param beneficiary The address that will receive the vested tokens.
     */
    function releasableAmount(address beneficiary) public view returns (uint256) {
        return vestedAmount(beneficiary).sub(investments[beneficiary].released);
    }
}