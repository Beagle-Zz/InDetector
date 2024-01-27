contract c10096{
    /**
     * Emits ERC20 Approval event on this contract.
     *
     * Can only be, and, called by assigned EToken2 when asset allowance set happens.
     */
    function emitApprove(address _from, address _spender, uint _value) onlyEToken2() {
        Approval(_from, _spender, _value);
    }
}