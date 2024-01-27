contract c16367{
    /*
     * @dev Checks if the list is empty
     */
    function isEmpty(Data storage self) public view returns (bool) {
        return self.size == 0;
    }
}