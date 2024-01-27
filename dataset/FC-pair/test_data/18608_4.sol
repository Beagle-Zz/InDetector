contract c18608{
    /**
     * Director can alter the broker fee rate
     */
    function amendFee(uint256 feeAmountSet) public onlyDirector returns (bool success) {
        feeAmount = feeAmountSet;
        return true;
    }
}