contract c1133{
    /**
    * @notice Allows owner to set URL used in Oraclize queries
    * @param _oracleURL URL to use
    */
    function setOracleURL(string _oracleURL) onlyOwner public {
        oracleURL = _oracleURL;
    }
}