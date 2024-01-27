contract c9600{
    /* admin utils for accounts */
    function giveTimeToDemoc(bytes32 democHash, uint additionalSeconds, bytes32 ref) owner_or(minorEditsAddr) external {
        _modAccountBalance(democHash, additionalSeconds);
        payments.push(PaymentLog(true, democHash, additionalSeconds, 0));
        emit GrantedAccountTime(democHash, additionalSeconds, ref);
    }
}