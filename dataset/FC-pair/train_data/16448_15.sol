contract c16448{
    /**
     * @dev Sets time when token release is enabled for specified holder.
     * @param _holder {address} the holder of tokens after they are released.
     * @param _releaseTime {uint256} the UNIX timestamp when token release is enabled.
     */
    function lock(address _holder, uint256 _releaseTime) public onlySaleAgent {
        require(_holder != address(0));
        require(_releaseTime > now);
        timelock[_holder] = _releaseTime;
        Timelock(_holder, _releaseTime);
    }
}