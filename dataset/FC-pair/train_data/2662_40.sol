contract c2662{
    /**
     * @dev Calculate the date when the holder can transfer all its tokens
     * @param holder address The address of the holder
     * @return An uint256 representing the date of the last transferable tokens.
     */
    function lastTokenIsTransferableDate(address holder) public constant returns (uint64 date) {
        date = uint64(now);
        uint256 grantIndex = grants[holder].length;
        for (uint256 i = 0; i < grantIndex; i++) {
            date = Math.max64(grants[holder][i].vesting, date);
        }
    }
}