contract c4906{
    /**
     * Only asset implementation contract assigned to sender is allowed to call.
     */
    modifier onlyAccess(address _sender) {
        if (getLatestVersion() == msg.sender) {
            _;
        }
    }
}