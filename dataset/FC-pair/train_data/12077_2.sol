contract c12077{
    /*
    * Returns the timestamp of next queue opening.
    */
    function getQueueOpening() public view returns (uint) {
        return messages[head].validTo;
    }
}