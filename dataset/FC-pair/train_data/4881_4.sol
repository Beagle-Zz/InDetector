contract c4881{
    /**
     * Only platform is allowed to call.
     */
    modifier onlyPlatform() {
        if (msg.sender == address(platform)) {
            _;
        }
    }
}