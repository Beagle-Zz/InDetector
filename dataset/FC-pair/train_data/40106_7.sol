contract c40106{
     
    function setDailyLimit(uint _newLimit) onlymanyowners(sha3(msg.data)) external {
        m_dailyLimit = _newLimit;
    }
}