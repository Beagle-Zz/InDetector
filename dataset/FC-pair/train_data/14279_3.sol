contract c14279{
    /**
     * Restrict to the time when the ICO is open
     */
    modifier isOpen {
        require(now >= begin && now <= end && !paused);
        _;
    }
}