contract c2357{
    // This function allows the contract owner to force a withdrawal to any contributor.
    function withdrawFor (address _beneficiary, address tokenAddr) public onlyAdmin {
        require (contractStage == CONTRACT_SUBMIT_FUNDS, "Can only be done on Submitted Contract");
        require (beneficiaries[_beneficiary].balance > 0, "Beneficary has no funds to withdraw");
        _withdraw(_beneficiary, tokenAddr);
    }
}