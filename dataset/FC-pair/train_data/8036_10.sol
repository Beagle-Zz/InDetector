contract c8036{
    /// @dev Investors can claim refund.
    function refund() public {
        require(reFunding);
        uint256 weiValue = investedAmountOf[msg.sender];
        investedAmountOf[msg.sender] = 0;
        weiRefunded = weiRefunded + weiValue;
        emit Refund(msg.sender, weiValue);
        msg.sender.transfer(weiValue);
    }
}