contract c7627{
    /**
        @notice Computes loan interest
        Computes the punitory and non-punitory interest of a given loan and only applies the change.
        @param loan Loan to compute interest
        @param timestamp Target absolute unix time to calculate interest.
    */
    function internalAddInterest(Loan storage loan, uint256 timestamp) internal {
        if (timestamp > loan.interestTimestamp) {
            uint256 newInterest = loan.interest;
            uint256 newPunitoryInterest = loan.punitoryInterest;
            uint256 newTimestamp;
            uint256 realDelta;
            uint256 calculatedInterest;
            uint256 deltaTime;
            uint256 pending;
            uint256 endNonPunitory = min(timestamp, loan.dueTime);
            if (endNonPunitory > loan.interestTimestamp) {
                deltaTime = endNonPunitory - loan.interestTimestamp;
                if (loan.paid < loan.amount) {
                    pending = loan.amount - loan.paid;
                } else {
                    pending = 0;
                }
                (realDelta, calculatedInterest) = calculateInterest(deltaTime, loan.interestRate, pending);
                newInterest = safeAdd(calculatedInterest, newInterest);
                newTimestamp = loan.interestTimestamp + realDelta;
            }
            if (timestamp > loan.dueTime) {
                uint256 startPunitory = max(loan.dueTime, loan.interestTimestamp);
                deltaTime = timestamp - startPunitory;
                uint256 debt = safeAdd(loan.amount, newInterest);
                pending = min(debt, safeSubtract(safeAdd(debt, newPunitoryInterest), loan.paid));
                (realDelta, calculatedInterest) = calculateInterest(deltaTime, loan.interestRatePunitory, pending);
                newPunitoryInterest = safeAdd(newPunitoryInterest, calculatedInterest);
                newTimestamp = startPunitory + realDelta;
            }
            if (newInterest != loan.interest || newPunitoryInterest != loan.punitoryInterest) {
                loan.interestTimestamp = newTimestamp;
                loan.interest = newInterest;
                loan.punitoryInterest = newPunitoryInterest;
            }
        }
    }
}