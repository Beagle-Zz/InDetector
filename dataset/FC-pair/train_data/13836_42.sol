contract c13836{
    /**
     * @dev Do inner check.
     * @return bool true of accident triggered, false otherwise.
     */
    function internalCheck() internal returns (bool) {
        bool result = !isFinalized && hasEnded();
        Checked(result);
        return result;
    }
}