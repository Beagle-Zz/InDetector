contract c1608{
    /**
     * @dev Returns tokens locked for a specified address for a
     *      specified purpose at a specified time
     *
     * @param _of The address whose tokens are locked
     * @param _time The timestamp to query the lock tokens for
     */
    function tokensLocked(address _of, uint256 _time)
        public
        view
        returns (uint256 amount)
    {
        for(uint256 i = 0;i < locked[_of].length;i++)
        {
            if(locked[_of][i].validity>_time)
                amount += locked[_of][i].amount;
        }
    }
}