contract c3575{
    /**
     * @dev Overrides the setBeneficiation fucntion to set the beneficiary of the refund safe
     *
     * @param _beneficiary The address of the beneficiary.
     */
    function setBeneficiary(address _beneficiary) public onlyOwner {
        super.setBeneficiary(_beneficiary);
        refundSafe.setBeneficiary(_beneficiary);
    }
}