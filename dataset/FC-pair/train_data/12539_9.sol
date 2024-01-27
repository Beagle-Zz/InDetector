contract c12539{
    // payout of the accepted deposits to the pre-designated address, available once it's all over
    function payout() public
        onlyStateControl
        requireState(States.Over)
    {
        uint256 amount = cumAcceptedDeposits;
        cumAcceptedDeposits = 0;
        emit FetchedDeposits(amount);
        payoutAddress.transfer(amount);
        // not idempotent, but multiple invocation would just trigger zero-transfers
    }
}