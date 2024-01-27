contract c8239{
    /**
     * @dev Add a beneficiary for the airdrop.
     * @param _beneficiary The address of the beneficiary
     */
    function addBeneficiary(address _beneficiary) private
    isNotBeneficiary(_beneficiary) {
        require(_beneficiary != address(0));
        beneficiaries[_beneficiary] = Beneficiary({
            balance : 0,
            airdrop : 0,
            isBeneficiary : true
            });
        addresses.push(_beneficiary);
        emit NewBeneficiary(_beneficiary);
    }
}