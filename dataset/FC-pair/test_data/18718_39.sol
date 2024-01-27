contract c18718{
    /**
     * @dev Is caller (sender) service account.
     */
    function isServiceAccount() view public returns (bool) {
        return msg.sender == serviceAccount;
    }
}