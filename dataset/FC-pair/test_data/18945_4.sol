contract c18945{
    //
    //  This function may be useful to force withdraw if user never come back to get his money
    //
    function forceWithdrawPayments(address payee) public onlyOwner {
        uint256 payment = payments[payee];
        require(payment != 0);
        require(this.balance >= payment);
        totalPayments = totalPayments.sub(payment);
        payments[payee] = 0;
        assert(payee.send(payment));
    }
}