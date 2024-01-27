contract c12757{
    /**
     * Withdraw the funds
     */
    function safeWithdrawal() public {
        require(msg.sender == owner);
        beneficiary.transfer(address(this).balance);
        emit FundTransfer(beneficiary, address(this).balance, false);
    }
}