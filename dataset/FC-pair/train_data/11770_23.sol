contract c11770{
    /**
     * @dev Withdraw _amount for _addr
     * @param _addr withdrawal address
     * @param _amount withdrawal amount
     */
    function withdraw(address _addr, uint256 _amount, bool investor) public onlyOwner {
        uint amount = investor ? data.investorBalanceOf(_addr)
        : data.balanceOf(_addr);
        require(amount >= _amount && address(this).balance >= _amount);
        if (investor) {
            data.subtrInvestorBalance(_addr, _amount * 1000000);
        } else {
            data.subtrBalance(_addr, _amount * 1000000);
        }
        _addr.transfer(_amount);
    }
}