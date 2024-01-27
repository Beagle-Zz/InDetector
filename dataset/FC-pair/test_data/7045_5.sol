contract c7045{
    /**
     * @dev Reset values of updating (KeyUpdate object)
     */
    function abortUpdate() external onlyAdmin {
        ResetUpdateState();
    }
}