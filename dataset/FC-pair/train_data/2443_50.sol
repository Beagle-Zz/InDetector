contract c2443{
    /**
     * @dev Is caller (sender) service account.
     */
    function isServiceAccount() public view returns (bool) {
        return msg.sender == serviceAccount;
    }
}