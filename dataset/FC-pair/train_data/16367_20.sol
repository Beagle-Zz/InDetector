contract c16367{
    /*
     * @dev Checks if the list is full
     */
    function isFull(Data storage self) public view returns (bool) {
        return self.size == self.maxSize;
    }
}