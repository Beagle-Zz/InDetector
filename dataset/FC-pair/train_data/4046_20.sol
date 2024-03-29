contract c4046{
    /**
    * @dev Check a certain node is in a blacklist
    * @param node  Check whether the user at a certain node is in a blacklist
    */
    function isPermitted(address node) public view returns (bool) {
        return !blacklisted[node];
    }
}