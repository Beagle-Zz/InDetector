contract c11575{
    /// @notice marks contract as audited
    /// @param _codeHash the code hash of the stamped contract. _codeHash equals to sha3 of the contract byte-code
    /// @param _isApproved whether the contract is approved or rejected
    function auditContract(bytes32 _codeHash, bool _isApproved)
    public whenNotPaused
    {
        bytes32 hashAuditorCode = keccak256(msg.sender, _codeHash);
        // revert if the contract is already audited by the auditor
        uint8 outcome = auditOutcomes[hashAuditorCode];
        require(outcome == NOT_AUDITED);
        if ( _isApproved )
            auditOutcomes[hashAuditorCode] = AUDITED_AND_APPROVED;
        else
            auditOutcomes[hashAuditorCode] = AUDITED_AND_REJECTED;
        uint reward = rewards[hashAuditorCode];
        totalRequestsAmount = totalRequestsAmount.sub(reward);
        commission = calcCommission(reward);
        availableCommission = availableCommission.add(commission);
        emit ContractAudited(msg.sender, _codeHash, reward, _isApproved);
        msg.sender.transfer(reward.sub(commission));
    }
}