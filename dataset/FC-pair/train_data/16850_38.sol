contract c16850{
    /*
     * checks only owner address is calling
    */
    modifier onlyOwnerOrOperator {
         require((msg.sender == owner || msg.sender == operator.addr) && msg.sender != 0x0);
         _;
    }
}