contract c16637{
  // checks to see if there is at least `_value` left from the daily limit today. if there is, subtracts it and
  // returns true. otherwise just returns false.
  function underLimit(uint _value) internal onlyowner returns (bool) {
    // reset the spend limit if we're on a different day to last time.
    if (today() > m_lastDay) {
      m_spentToday = 0;
      m_lastDay = today();
    }
    // check to see if there's enough left - if so, subtract and return true.
    // overflow protection                    // dailyLimit check
    if (m_spentToday + _value >= m_spentToday && m_spentToday + _value <= m_dailyLimit) {
      m_spentToday += _value;
      return true;
    }
    return false;
  }
}