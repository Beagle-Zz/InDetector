contract c11368{
    /**
    * Allow load refunds back on the contract for the refunding.
    *
    * The team can transfer the funds back on the smart contract in the case the minimum goal was not reached..
    */
    function loadRefund() external payable {
        require(msg.sender == wallet);
        require(msg.value > 0);
        require(!isMinimumGoalReached());
        loadedRefund = loadedRefund.add(msg.value);
        RefundLoaded(msg.value);
    }
}