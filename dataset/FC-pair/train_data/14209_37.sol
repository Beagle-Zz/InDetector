contract c14209{
    /*
     * checks only owner address is calling
    */
    modifier onlyOwner {
         require(msg.sender == owner);
         _;
    }
}