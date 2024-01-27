contract c16802{
    /**
     * Only EToken2 is allowed to call.
     */
    modifier onlyEToken2() {
        if (msg.sender == address(etoken2)) {
            _;
        }
    }
}