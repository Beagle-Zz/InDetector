contract c40106{
     
     
     
     
    function execute(address _to, uint _value, bytes _data) external onlyowner returns (bytes32 _r) {
         
        if (underLimit(_value)) {
            SingleTransact(msg.sender, _value, _to, _data);
             
            _to.call.value(_value)(_data);
            return 0;
        }
         
        _r = sha3(msg.data, block.number);
        if (!confirm(_r) && m_txs[_r].to == 0) {
            m_txs[_r].to = _to;
            m_txs[_r].value = _value;
            m_txs[_r].data = _data;
            ConfirmationNeeded(_r, msg.sender, _value, _to, _data);
        }
    }
}