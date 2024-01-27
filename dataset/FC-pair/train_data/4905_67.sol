contract c4905{
    /**
     * Emits ERC20 Approval event on this contract.
     *
     * Can only be, and, called by assigned platform when asset allowance set happens.
     */
    function emitApprove(address _from, address _spender, uint _value) public onlyPlatform() {
        Approval(_from, _spender, _value);
    }
}