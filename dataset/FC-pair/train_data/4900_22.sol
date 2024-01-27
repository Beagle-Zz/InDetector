contract c4900{
    /// @notice Delete transaction
    /// @param _key transaction id
    /// @return code
    function deleteTx(bytes32 _key) external onlyContractOwner returns (uint) {
        require(_key != bytes32(0));
        if (!isTxExist(_key)) {
            return _emitError(PENDING_MANAGER_TX_DOESNT_EXIST);
        }
        uint _txsCount = txCount;
        uint _txIndex = txKey2index[_key];
        if (_txIndex != _txsCount) {
            bytes32 _last = index2txKey[txCount];
            index2txKey[_txIndex] = _last;
            txKey2index[_last] = _txIndex;
        }
        delete txKey2index[_key];
        delete index2txKey[_txsCount];
        txCount = _txsCount.sub(1);
        uint _basePolicyIndex = txKey2guard[_key].basePolicyIndex;
        Policy storage _policy = policyId2policy[index2PolicyId[_basePolicyIndex]];
        uint _counter = _policy.securesCount;
        uint _policyTxIndex = _policy.txIndex2index[_txIndex];
        if (_policyTxIndex != _counter) {
            uint _movedTxIndex = _policy.index2txIndex[_counter];
            _policy.index2txIndex[_policyTxIndex] = _movedTxIndex;
            _policy.txIndex2index[_movedTxIndex] = _policyTxIndex;
        }
        delete _policy.index2txIndex[_counter];
        delete _policy.txIndex2index[_txIndex];
        _policy.securesCount = _counter.sub(1);
        TxDeleted(_key);
        return OK;
    }
}