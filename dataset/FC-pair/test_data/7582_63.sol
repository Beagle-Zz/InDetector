contract c7582{
    /* If a confiscation court motion has passed and reached the confirmation
     * state, the court may transfer the target account's balance to the fee pool
     * and freeze its participation in further transactions. */
    function freezeAndConfiscate(address target)
        external
        onlyCourt
    {
        // A motion must actually be underway.
        uint motionID = court.targetMotionID(target);
        require(motionID != 0);
        // These checks are strictly unnecessary,
        // since they are already checked in the court contract itself.
        require(court.motionConfirming(motionID));
        require(court.motionPasses(motionID));
        require(!frozen[target]);
        // Confiscate the balance in the account and freeze it.
        uint balance = tokenState.balanceOf(target);
        tokenState.setBalanceOf(FEE_ADDRESS, safeAdd(tokenState.balanceOf(FEE_ADDRESS), balance));
        tokenState.setBalanceOf(target, 0);
        frozen[target] = true;
        emitAccountFrozen(target, balance);
        emitTransfer(target, FEE_ADDRESS, balance);
    }
}