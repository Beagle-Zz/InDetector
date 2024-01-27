contract c10993{
    /**
     * transfer and lock this value
     * only called by admins (limit when setLock)
     */
    function transferAndLock(address _to, uint256 _value, uint256 _releaseTimeS) public returns (bool) {
        //at first, try lock address
        setLock(_to,_value,_releaseTimeS);
        if( !transfer(_to, _value) ){
            //revert with lock
            revert();
        }
        return true;
    }
}