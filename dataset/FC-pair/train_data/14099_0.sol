contract c14099{
    /*
     * checks only owner address is calling
    */
    modifier onlyOwner 
    {
        require(msg.sender == owner);
         _;
    }
}