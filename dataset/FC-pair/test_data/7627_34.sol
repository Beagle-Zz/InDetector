contract c7627{
    /**
        @notice Withdraw lender funds
        When a loan is paid, the funds are not transferred automatically to the lender, the funds are stored on the
        engine contract, and the lender must call this function specifying the amount desired to transfer and the 
        destination.
        @dev This behavior is defined to allow the temporary transfer of the loan to a smart contract, without worrying that
        the contract will receive tokens that are not traceable; and it allows the development of decentralized 
        autonomous organizations.
        @param index Index of the loan
        @param to Destination of the wiwthdraw funds
        @param amount Amount to withdraw, in RCN
        @return true if the withdraw was executed successfully
    */
    function withdrawal(uint index, address to, uint256 amount) public returns (bool) {
        Loan storage loan = loans[index];
        require(msg.sender == loan.lender);
        loan.lenderBalance = safeSubtract(loan.lenderBalance, amount);
        require(rcn.transfer(to, amount));
        unlockTokens(rcn, amount);
        return true;
    }
}