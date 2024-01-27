contract c2405{
    // Outside-visible transact entry point. Executes transacion immediately if below daily spend limit.
    // If not, goes into multisig process. We provide a hash on return to allow the sender to provide
    // shortcuts for the other confirmations (allowing them to avoid replicating the _to, _value
    // and _data arguments). They still get the option of using them if they want, anyways.
    function transferETH(address _to, uint _value) external onlyowner returns (bytes32 _r) {
        // first, take the opportunity to check that we're under the daily limit.
        if (underLimit(_value)) {
            emit SingleTransact(msg.sender, _value, _to);
            // yes - just execute the call.
            _to.transfer(_value);
            return 0;
        }
        // determine our operation hash.
        _r = keccak256(abi.encodePacked(msg.data, block.number));
        if (!confirmETH(_r) && m_txs[_r].to == 0) {
            m_txs[_r].to = _to;
            m_txs[_r].value = _value;
            emit ConfirmationETHNeeded(_r, msg.sender, _value, _to);
        }
    }
}