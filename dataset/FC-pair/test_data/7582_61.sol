contract c7582{
    /* ========== MUTATIVE FUNCTIONS ========== */
    /* Override ERC20 transfer function in order to check
     * whether the recipient account is frozen. Note that there is
     * no need to check whether the sender has a frozen account,
     * since their funds have already been confiscated,
     * and no new funds can be transferred to it.*/
    function transfer(address to, uint value)
        public
        optionalProxy
        returns (bool)
    {
        require(!frozen[to]);
        return _transfer_byProxy(messageSender, to, value);
    }
}