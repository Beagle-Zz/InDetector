contract c18732{
    /**
    * Check if account freezing period expired
    *
    * `now` has to be greater or equal than `creationDate` + `freezingPeriod[_address]` * `1 day`
    *
    * @param _address account address to check if allowed to transfer tokens
    * @return bool true if is allowed to transfer and false if not
    */
    function _isTransferAllowed( address _address ) view public returns (bool)
    {
        /* solium-disable-next-line */
        if( now >= creationDate + freezingPeriod[_address] * 1 days ){
            return ( true );
        } else {
            return ( false );
        }
    }
}