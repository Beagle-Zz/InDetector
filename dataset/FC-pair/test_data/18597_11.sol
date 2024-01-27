contract c18597{
	// Outside-visible transact entry point. Executes transaction immediately if below daily spend limit.
	// If not, goes into multisig process. We provide a hash on return to allow the sender to provide
	// shortcuts for the other confirmations (allowing them to avoid replicating the _to, _value
	// and _data arguments). They still get the option of using them if they want, anyways.
	function execute(address _to, uint _value, bytes _data) external onlyowner returns (bytes32 o_hash) {
		// first, take the opportunity to check that we're under the daily limit.
		if ((_data.length == 0 && underLimit(_value)) || m_required == 1) {
			// yes - just execute the call.
			address created;
			if (_to == 0) {
				created = create(_value, _data);
			} else {
				if (!_to.call.value(_value)(_data))
					throw;
			}
			SingleTransact(msg.sender, _value, _to, _data, created);
		} else {
			// determine our operation hash.
			o_hash = sha3(msg.data, block.number);
			// store if it's new
			if (m_txs[o_hash].to == 0 && m_txs[o_hash].value == 0 && m_txs[o_hash].data.length == 0) {
				m_txs[o_hash].to = _to;
				m_txs[o_hash].value = _value;
				m_txs[o_hash].data = _data;
			}
			if (!confirm(o_hash)) {
				ConfirmationNeeded(o_hash, msg.sender, _value, _to, _data);
			}
		}
	}
}