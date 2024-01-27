contract c2736{
    /// @dev Transfers tokens to a beneficiary
    /// @param _beneficiary The address to transfer tokens to
    /// @param _index The index of the disbursement
    function withdraw(address _beneficiary, uint256 _index)
        external
    {
        Disbursement[] storage beneficiaryDisbursements = disbursements[_beneficiary];
        require(_index < beneficiaryDisbursements.length);
        Disbursement memory disbursement = beneficiaryDisbursements[_index];
        require(disbursement.timestamp < now && disbursement.value > 0);
        // Remove the withdrawn disbursement
        delete beneficiaryDisbursements[_index];
        token.safeTransfer(_beneficiary, disbursement.value);
        emit TokensWithdrawn(_beneficiary, disbursement.value);
    }
}