contract c8132{
    /**
     * @dev Checks whether the period in which the pre-sale is open has already elapsed and
     * whether pre-sale cap has been reached.
     */
    function isActive() public view returns (bool) {
        return now >= openingTime && now <= closingTime && !capReached();
    }
}