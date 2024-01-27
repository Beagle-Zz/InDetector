contract c3068{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, F4Ddatasets.EventReturns memory _eventData_)
        private
        returns(F4Ddatasets.EventReturns)
    {
        // pay 14% out to owner rewards
        uint256 _own = _eth.mul(14) / 100;
        owner_.transfer(_own);
        return(_eventData_);
    }
}