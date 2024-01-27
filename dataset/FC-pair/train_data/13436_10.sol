contract c13436{
    /**
     * @notice Allows the owner to clear the contract. Remain tokens are returned to the owner.
     */
    function clearAll() public onlyOwner {
        token.transfer(owner, token.balanceOf(this));
        for (uint i = 0; i < addresses.length; i++) {
            Beneficiary storage beneficiary = beneficiaries[addresses[i]];
            beneficiary.isBeneficiary = false;
            beneficiary.released = 0;
            beneficiary.vested = 0;
            beneficiary.start = 0;
            beneficiary.cliff = 0;
            beneficiary.duration = 0;
            beneficiary.revoked = false;
            beneficiary.revocable = false;
            beneficiary.description = "";
        }
        addresses.length = 0;
    }
}