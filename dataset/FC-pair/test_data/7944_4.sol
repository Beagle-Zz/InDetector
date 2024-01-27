contract c7944{
    // set lockup for strategic investor
    function setLockup_investors(address _investor, uint256 _value, uint256 _delieveryDate)
        public
        onlyOwner
    {
        require(_investor != address(0));
        investors_locked[_investor] = _value;
        investors_deliveryDate[_investor] = _delieveryDate;
        UpdatedLockingState("investor", _investor, _value, _delieveryDate);
    }
}