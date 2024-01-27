contract c2281{
    /**
    *@dev Counts number of contacts created by this factory
    *@return the number of contracts
    */
    function getCount() public constant returns(uint) {
        return contracts.length;
    }
}