contract c2166{
    /**
     * @dev Calculate the total amount of transferable tokens of a holder for the current moment of calling.
     * @param holder address The address of the holder
     * @return An uint256 representing a holder's total amount of transferable tokens.
     */
    function transferableTokensNow(address holder) public constant returns (uint) {
        return transferableTokens(holder, uint64(now));
    }
}