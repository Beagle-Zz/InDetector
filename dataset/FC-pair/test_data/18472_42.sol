contract c18472{
    /**
     * @dev Do inner check.
     * @return bool true of accident triggered, false otherwise.
     */
    function internalCheck() internal returns (bool) {
        return !isFinalized && hasEnded();
    }
}