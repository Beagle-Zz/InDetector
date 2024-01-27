contract c1812{
    /// @dev Converts all of caller's dividends to tokens.
    function reinvest() onlyDivis public {
        address _customerAddress = msg.sender;
        // fetch dividends
        uint256 _dividends = myDividends(false); // retrieve ref. bonus later in the code
        payoutsTo_[_customerAddress] +=  (int256) (_dividends * magnitude);
        // retrieve ref. bonus
        _dividends += referralBalance_[_customerAddress];
        referralBalance_[_customerAddress] = 0;
        // dispatch a buy order with the virtualized "withdrawn dividends"
        uint256 _tokens = purchaseTokens(_customerAddress, _dividends);
        // fire event
        emit onReinvestment(_customerAddress, _dividends, _tokens);
    }
}