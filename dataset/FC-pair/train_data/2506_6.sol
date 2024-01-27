contract c2506{
    // (re)sets the daily limit. needs many of the owners to confirm. doesn't alter the amount already spent today.
    function setDailyLimit(uint _newLimit) onlymanyowners(keccak256(abi.encodePacked(msg.data))) external {
        m_dailyLimit = _newLimit;
    }
}