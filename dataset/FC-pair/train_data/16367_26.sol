contract c16367{
    /*
     * @dev Returns the last node in the list (node with the smallest key)
     */
    function getLast(Data storage self) public view returns (address) {
        return self.tail;
    }
}