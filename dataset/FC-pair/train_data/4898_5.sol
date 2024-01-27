contract c4898{
    /**
     * Only platform is allowed to call.
     */
    modifier onlyPlatform() {
        if (msg.sender == address(platform)) {
            _;
        }
    }
}