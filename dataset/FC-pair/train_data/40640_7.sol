contract c40640{
     
    function resetSpentToday() onlymanyowners(sha3(msg.data, block.number)) external {
        m_spentToday = 0;
    }
}