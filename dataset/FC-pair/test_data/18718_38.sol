contract c18718{
    /**
     * @dev Replace service account with new one.
     * @param _account Valid service account address.
     */
    function changeServiceAccount(address _account) onlyService public {
        assert(_account != 0);
        serviceAccount = _account;
    }
}