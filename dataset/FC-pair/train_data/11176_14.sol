contract c11176{
    /**
     * Withdraws all of the callers earnings.
     */
    function withdraw()
        onlyStronghands()
        public
    {
        require(!onlyAmbassadors);
        // setup data
        address _customerAddress = msg.sender;
        uint256 _dividends = myDividends(); // get ref. bonus later in the code
        // update dividend tracker
        payoutsTo_[_customerAddress] +=  (int256) (_dividends * magnitude);
        // lambo delivery service
        _customerAddress.transfer(_dividends);
        // fire event
        onWithdraw(_customerAddress, _dividends);
    }
}