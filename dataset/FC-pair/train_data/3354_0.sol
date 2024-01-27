contract c3354{
    /**
     * Only assigned proxy is allowed to call.
     */
    modifier onlyProxy() {
        if (proxy == msg.sender) {
            _;
        }
    }
}