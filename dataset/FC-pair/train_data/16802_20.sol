contract c16802{
    /**
     * Emits ERC20 Transfer event on this contract.
     *
     * Can only be, and, called by assigned EToken2 when asset transfer happens.
     */
    function emitTransfer(address _from, address _to, uint _value) onlyEToken2() {
        Transfer(_from, _to, _value);
    }
}