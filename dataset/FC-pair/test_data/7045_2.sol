contract c7045{
    /**
     * @dev Reset values of pending (Transaction object)
     */
    function abortTransaction() external onlyAdmin{
        ResetTransferState();
    }
}