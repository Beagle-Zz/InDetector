contract c4870{
    /// @notice Add transaction
    ///
    /// @param _key transaction id
    ///
    /// @return code
    function addTx(bytes32 _key, bytes4 _sig, address _contract) external onlyAuthorized returns (uint) {
        require(_key != bytes32(0));
        require(_sig != bytes4(0));
        require(_contract != 0x0);
        bytes32 _policyHash = keccak256(_sig, _contract);
        require(isPolicyExist(_policyHash));
        if (isTxExist(_key)) {
            return _emitError(PENDING_DUPLICATE_TX);
        }
        if (_policyHash == bytes32(0)) {
            return _emitError(PENDING_MANAGER_POLICY_NOT_FOUND);
        }
        uint _index = txCount.add(1);
        txCount = _index;
        index2txKey[_index] = _key;
        txKey2index[_key] = _index;
        Guard storage _guard = txKey2guard[_key];
        _guard.basePolicyIndex = policyId2Index[_policyHash];
        _guard.state = GuardState.InProcess;
        Policy storage _policy = policyId2policy[_policyHash];
        uint _counter = _policy.securesCount.add(1);
        _policy.securesCount = _counter;
        _policy.index2txIndex[_counter] = _index;
        _policy.txIndex2index[_index] = _counter;
        ProtectionTxAdded(_key, _policyHash, block.number);
        return OK;
    }
}