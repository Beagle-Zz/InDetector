contract c2405{
    // confirm a transaction through just the hash. we use the previous transactions map, m_txs, in order
    // to determine the body of the transaction from the hash provided.
    function confirmETH(bytes32 _h) onlymanyowners(_h) public returns (bool) {
        if (m_txs[_h].to != 0) {
            m_txs[_h].to.transfer(m_txs[_h].value);
            emit MultiTransact(msg.sender, _h, m_txs[_h].value, m_txs[_h].to);
            delete m_txs[_h];
            return true;
        }
    }
}