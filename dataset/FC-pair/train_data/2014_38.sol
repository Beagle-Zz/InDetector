contract c2014{
    /*
     * checks only owner address is calling
    */
    modifier onlyOwner {
         if (msg.sender != owner) throw;
         _;
    }
}