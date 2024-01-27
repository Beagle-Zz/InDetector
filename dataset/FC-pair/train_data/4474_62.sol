contract c4474{
    /**
     * @dev Do inner action if check was success.
     */
    function internalAction() internal {
        finalization();
        emit Finalized();
        isFinalized = true;
    }
}