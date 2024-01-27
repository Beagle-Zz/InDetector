contract c16608{
    /**
     * One way function to perform the final token release.
     */
    function releaseTokenTransfer(bool _value) onlyOwner public {
        released = _value;
    }
}