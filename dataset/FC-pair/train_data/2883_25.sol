contract c2883{
    /// @dev change gas price for oraclize calls,
    ///      should be a compromise between speed and price according to market
    /// @param _gasPrice gas price in wei
    function setOraclizeGasPrice(uint _gasPrice)
        external
        onlymanyowners(keccak256(msg.data))
    {
        oraclize_setCustomGasPrice(_gasPrice);
    }
}