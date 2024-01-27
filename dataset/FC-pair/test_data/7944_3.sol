contract c7944{
    // set lockup for contributors 
    function setLockup_contributors(address _contributor, uint256 _value, uint256 _countdownDate)
        public
        onlyOwner
    {
        require(_contributor != address(0));
        contributors_locked[_contributor] = _value;
        contributors_countdownDate[_contributor] = _countdownDate;
        UpdatedLockingState("contributor", _contributor, _value, _countdownDate);
    }
}