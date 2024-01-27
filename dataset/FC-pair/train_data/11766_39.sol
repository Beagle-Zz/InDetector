contract c11766{
    /**
     * @dev Is caller (sender) service account.
     */
    function isServiceAccount() view public returns (bool) {
        return msg.sender == serviceAccount;
    }
}