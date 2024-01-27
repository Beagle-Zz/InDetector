contract c40203{
     
    function setDailyLimit(uint _newLimit) onlymanyowners(sha3(msg.data, block.number)) external {
        m_dailyLimit = _newLimit;
    }
}