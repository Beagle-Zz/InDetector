contract c7461{
    /// convience function to disburse multiple payments in a single tx
    function disburseAuthorizedPayments(uint[] _idPayments) public {
        for (uint i = 0; i < _idPayments.length; i++) {
            uint _idPayment = _idPayments[i];
            disburseAuthorizedPayment(_idPayment);
        }
    }
}