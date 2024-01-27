contract c18810{
    /* If a confiscation court motion has passed and reached the confirmation
     * state, the court may transfer the target account's balance to the fee pool
     * and freeze its participation in further transactions. */
    function confiscateBalance(address target)
        external
    {
        // Should be callable only by the confiscation court.
        require(Court(msg.sender) == court);
        // A motion must actually be underway.
        uint motionID = court.targetMotionID(target);
        require(motionID != 0);
        // These checks are strictly unnecessary,
        // since they are already checked in the court contract itself.
        // I leave them in out of paranoia.
        require(court.motionConfirming(motionID));
        require(court.motionPasses(motionID));
        require(!frozen[target]);
        // Confiscate the balance in the account and freeze it.
        uint balance = state.balanceOf(target);
        state.setBalanceOf(address(this), safeAdd(state.balanceOf(address(this)), balance));
        state.setBalanceOf(target, 0);
        frozen[target] = true;
        emit AccountFrozen(target, target, balance);
        emit Transfer(target, address(this), balance);
    }
}