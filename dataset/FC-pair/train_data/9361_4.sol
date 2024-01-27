contract c9361{
    /**
     * @dev Getter to determine if address is in investorList.
     * @param addr address
     * @return true if the address was added to the investorList, false if the address was already in the investorList
     */
    function inList(address addr)
        public
        view
        returns (bool)
    {
        if (bytes(investorList[addr]).length != 0) {
            return true;
        } else {
            return false;
        }
    }
}