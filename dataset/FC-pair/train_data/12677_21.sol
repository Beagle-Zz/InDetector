contract c12677{
    /**
     * @dev Set profit transfer time span.
     */
    function setProfitTransferTimeSpan(uint _profitTransferTimeSpan)
        public
        onlyOwner
        onlyValidTransferTimeSpan(_profitTransferTimeSpan)
    {
        profitTransferTimeSpan = _profitTransferTimeSpan;
    }
}