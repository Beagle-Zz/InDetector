contract c2405{
    // (re)sets the daily limit. needs many of the owners to confirm. doesn't alter the amount already spent today.
    function resetSpentToday() onlymanyowners(keccak256(abi.encodePacked(msg.data))) external {
        m_spentToday = 0;
    }
}