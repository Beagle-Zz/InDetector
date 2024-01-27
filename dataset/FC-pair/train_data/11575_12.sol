contract c11575{
    /// @notice withdraws an audit request
    /// @param _auditor the address of the auditor the request is directed to
    /// @param _codeHash the code hash of the contract to audit. _codeHash equals to sha3 of the contract byte-code
    function withdrawRequest(address _auditor, bytes32 _codeHash)
    public
    {
        bytes32 hashAuditorCode = keccak256(_auditor, _codeHash);
        // revert if the contract is already audited by the auditor
        uint8 outcome = auditOutcomes[hashAuditorCode];
        require(outcome == NOT_AUDITED);
        bytes32 hashAuditorRequestorCode = keccak256(_auditor, msg.sender, _codeHash);
        AuditRequest storage request = auditRequests[hashAuditorRequestorCode];
        require(request.amount > 0);
        require(now > request.expireDate);
        uint amount = request.amount;
        delete request.amount;
        delete request.expireDate;
        rewards[hashAuditorCode] = rewards[hashAuditorCode].sub(amount);
        totalRequestsAmount = totalRequestsAmount.sub(amount);
        emit RequestWithdrawn(_auditor, msg.sender, _codeHash, amount);
        msg.sender.transfer(amount);
    }
}