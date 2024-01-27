contract c10565{
    /**
     * @dev Enable Transfers (Only Owner)
     */
    function toggleTransferable(bool _toggle) external
        onlyOwner
    {
        isTokenTransferable = _toggle;
    }
}