contract c8655{
    /* Helper function for UI.
        Returns max loan amount based on minLoanAmont using LTD params */
    function getMaxLoanAmount(uint minLoanAmount) external view returns (uint maxLoan) {
        uint allowedByLtd = getMaxLoanAmountAllowedByLtd();
        maxLoan = allowedByLtd < minLoanAmount ? 0 : allowedByLtd;
    }
}