contract c7582{
    /* The owner may allow a previously-frozen contract to once
     * again accept and transfer nomins. */
    function unfreezeAccount(address target)
        external
        optionalProxy_onlyOwner
    {
        require(frozen[target] && target != FEE_ADDRESS);
        frozen[target] = false;
        emitAccountUnfrozen(target);
    }
}