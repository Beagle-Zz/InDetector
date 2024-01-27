contract c13848{
    /**
     * Freeze (temporarily) an investor.
     */
    function freeze(address investor) onlyOwner public returns (bool) {
        require(investor != address(0));
        require(!freezed[investor]);
        freezed[investor] = true;
        Freezed(investor);
        return freezed[investor];
    }
}