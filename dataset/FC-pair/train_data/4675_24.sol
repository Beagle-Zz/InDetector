contract c4675{
    /**
     * Only asset implementation contract assigned to sender is allowed to call.
     */
    modifier onlyImplementationFor(address _sender) {
        if (getVersionFor(_sender) == msg.sender) {
            _;
        }
    }
}