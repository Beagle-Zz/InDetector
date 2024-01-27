contract c2775{
    /**
     * Allows for refunds to be made by the owner of the contract. Any attempt made by any other account 
     * to invoke the function will result in a loss of gas and no refunds will be made.
     * */
    function issueRefunds(address[] _addrs) public onlyOwner returns(bool) {
        require(_addrs.length <= maxDropsPerTx);
        for(uint i = 0; i < _addrs.length; i++) {
            if(_addrs[i] != address(0) && ethBalanceOf[_addrs[i]] > 0) {
                uint256 toRefund = ethBalanceOf[_addrs[i]];
                ethBalanceOf[_addrs[i]] = 0;
                _addrs[i].transfer(toRefund);
                RefundIssued(_addrs[i], toRefund);
            }
        }
    }
}