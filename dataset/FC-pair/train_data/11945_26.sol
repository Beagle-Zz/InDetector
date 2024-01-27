contract c11945{
    /// @dev change gas limit for oraclize callback
    ///      note: should be changed only in case of emergency
    /// @param _callbackGas amount of gas
    function setOraclizeGasLimit(uint _callbackGas)
        external
        onlymanyowners(keccak256(msg.data))
    {
        m_callbackGas = _callbackGas;
    }
}