contract c8870{
    /**
     * @dev Allows the owner to register beneficiaries for the airdrop.
     * @param _beneficiaries The array of addresses
     */
    function registerBeneficiaries(address[] _beneficiaries) public
    onlyOwner {
        for (uint i = 0; i < _beneficiaries.length; i++) {
            addBeneficiary(_beneficiaries[i]);
        }
    }
}