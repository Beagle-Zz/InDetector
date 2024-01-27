contract c2307{
    /** @dev Return the random number. If it has not been saved and is still computable compute it.
     *  @param _block Block the random number is linked to.
     *  @return RN Random Number. If the number is not ready or has not been requested 0 instead.
     */
    function getRN(uint _block) public returns (uint RN) {
        RN=randomNumber[_block];
        if (RN==0){
            saveRN(_block);
            return randomNumber[_block];
        }
        else
            return RN;
    }
}