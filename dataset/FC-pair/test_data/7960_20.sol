contract c7960{
    /**
     * @dev Extends the transaction validation to check if the value this higher than the minumum cap.
     */
    function validateTransaction() internal view {
        super.validateTransaction();
        require(msg.value >= individualMinCap);
    }
}