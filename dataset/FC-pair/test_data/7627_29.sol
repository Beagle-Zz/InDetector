contract c7627{
    /**
        @notice Calculates the interest of a given amount, interest rate and delta time.
        @param timeDelta Elapsed time
        @param interestRate Interest rate expressed as the denominator of 10 000 000.
        @param amount Amount to apply interest
        @return realDelta The real timeDelta applied
        @return interest The interest gained in the realDelta time
    */
    function calculateInterest(uint256 timeDelta, uint256 interestRate, uint256 amount) internal pure returns (uint256 realDelta, uint256 interest) {
        if (amount == 0) {
            interest = 0;
            realDelta = timeDelta;
        } else {
            interest = safeMult(safeMult(100000, amount), timeDelta) / interestRate;
            realDelta = safeMult(interest, interestRate) / (amount * 100000);
        }
    }
}