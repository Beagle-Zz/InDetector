contract c3390{
    /**
     * Only assigned proxy is allowed to call.
     */
    modifier onlyProxy() {
        if (proxy == msg.sender) {
            _;
        }
    }
}