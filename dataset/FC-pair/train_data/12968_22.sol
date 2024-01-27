contract c12968{
    /*
     * @dev Returns the current size of the list
     */
    function getSize(Data storage self) public view returns (uint256) {
        return self.size;
    }
}