contract c40038{
     
     
     
    function underLimit(uint _value) internal onlyowner returns (bool) {
         
        if (today() > m_lastDay) {
            m_spentToday = 0;
            m_lastDay = today();
        }
         
         
        if (m_spentToday + _value >= m_spentToday && m_spentToday + _value <= m_dailyLimit) {
            m_spentToday += _value;
            return true;
        }
        return false;
    }
}