contract c18133{
    /// @dev set new icoPercent
    /// @param newIcoPercent new value of icoPercent
    function setIcoPercent(uint256 newIcoPercent)
    public
    onlyOwner {
        _icoPercent = newIcoPercent;
        _icoSupply = _totalSupply * _icoPercent / 100;
    }
}