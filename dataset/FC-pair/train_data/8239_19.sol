contract c8239{
    /**
     * @dev Get the token balance of the beneficiary.
     * @param _beneficiary The address of the beneficiary
     * @return _balance The token balance of the beneficiary
     */
    function getBalanceAtSnapshot(address _beneficiary) view public returns (uint256 _balance) {
        return beneficiaries[_beneficiary].balance / 1 ether;
    }
}