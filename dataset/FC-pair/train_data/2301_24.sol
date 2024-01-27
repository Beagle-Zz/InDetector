contract c2301{
    /** @dev Get a uncorrelated random number. Act like getRN but give a different number for each sender.
     *  This is to prevent users from getting correlated numbers.
     *  @param _block Block the random number is linked to.
     *  @return RN Random Number. If the number is not ready or has not been required 0 instead.
     */
    function getUncorrelatedRN(uint _block) public returns (uint RN) {
        uint baseRN=getRN(_block);
        if (baseRN==0)
            return 0;
        else
            return uint(keccak256(msg.sender,baseRN));
    }
}