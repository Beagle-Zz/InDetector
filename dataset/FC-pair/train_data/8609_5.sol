contract c8609{
    /**
    * alan: get lock status
    */
    function isLocked(address addr) public view returns(bool) 
    {
        return locked[addr];
    }
}