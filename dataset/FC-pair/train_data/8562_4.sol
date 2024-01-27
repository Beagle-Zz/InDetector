contract c8562{
    /**
    * alan: lock or unlock account
    */
    function lockAccount(address _addr) public onlyAdmin returns (bool)
    {
        require(_addr != address(0));
        locked[_addr] = true;
        return true;
    }
}