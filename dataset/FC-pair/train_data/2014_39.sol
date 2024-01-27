contract c2014{
    /*
     * checks only treasury address is calling
    */
    modifier onlyTreasury {
         if (msg.sender != treasury) throw;
         _;
    }    
}