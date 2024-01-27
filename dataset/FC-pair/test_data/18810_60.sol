contract c18810{
    /* The owner may destroy this contract, returning all funds back to the beneficiary
     * wallet, may only be called after the contract has been in
     * liquidation for at least liquidationPeriod, or all circulating
     * nomins have been sold back into the pool. */
    function selfDestruct()
        external
        optionalProxy_onlyOwner
    {
        require(canSelfDestruct());
        emit SelfDestructed(beneficiary);
        selfdestruct(beneficiary);
    }
}