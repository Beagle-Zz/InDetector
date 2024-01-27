contract c16576{
    /*
     * checks only owner address is calling
    */
    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _;
    }
}