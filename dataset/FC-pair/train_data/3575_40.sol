contract c3575{
    /**
     * @dev Sets The beneficiary address.
     *
     * @param _beneficiary The address of the beneficiary.
     */
    function setBeneficiary(address _beneficiary) public onlyOwner {
        require(_beneficiary != address(0));
        beneficiary = _beneficiary;
    }
}