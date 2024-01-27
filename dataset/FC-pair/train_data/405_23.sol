contract c405{
    /**
    * @notice Allows owner to set new gas price for future Oraclize queries
    * @notice NB - this will only impact newly scheduled Oraclize queries, not future queries which have already been scheduled
    * @param _gasPrice gas price to use for Oraclize callbacks
    */
    function setGasPrice(uint256 _gasPrice) onlyOwner public {
        oraclize_setCustomGasPrice(_gasPrice);
    }
}