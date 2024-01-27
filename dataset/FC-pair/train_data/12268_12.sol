contract c12268{
    /**
     * Getters to allow the same blacklist to be used also by other contracts 
     */
    function getBlackListStatus(address _maker) external view returns (bool) {
        return isBlackListed[_maker];
    }
}