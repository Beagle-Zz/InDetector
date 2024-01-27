contract c2443{
    /**
     * @dev Do inner check.
     * @return bool true of accident triggered, false otherwise.
     */
    function internalCheck() internal returns (bool) {
        bool result = !isFinalized && hasClosed();
        emit Checked(result);
        return result;
    }
}