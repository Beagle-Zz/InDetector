contract c13540{
    // This exists for safety when we have to run refund process by some reason.
    function refund(address _addr)
        external
        returns (bool)
    {
        require(!ignited && !finalized);
        require(msg.sender == distributor); // only for distributor
        require(_addr != address(0));
        if(buyers[_addr] == 0) return false;
        uint256 refundAmount = buyers[_addr];
        buyers[_addr] = 0;
        _addr.transfer(refundAmount);
        emit Refund(_addr, refundAmount);
        return true;
    }
}