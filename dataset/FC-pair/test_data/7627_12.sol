contract c7627{
    /**
        @notice Creates a loan request, the loan can be generated with any borrower and conditions; if the borrower agrees
        it must call the "approve" function. If the creator of the loan is the borrower the approve is done automatically.
        @dev The creator of the loan is the caller of this function; this is useful to track which wallet created the loan.
            Two identical loans cannot exist, a clone of another loan will fail.
        @param _oracleContract Address of the Oracle contract, if the loan does not use any oracle, this field should be 0x0.
        @param _borrower Address of the borrower
        @param _currency The currency to use with the oracle, the currency code is generated with the following formula,
            keccak256(ticker), is always stored as the minimum divisible amount. (Ej: ETH Wei, USD Cents)
        @param _amount The requested amount; currency and unit are defined by the Oracle, if there is no Oracle present
            the currency is RCN, and the unit is wei.
        @param _interestRate The non-punitory interest rate by second, defined as a denominator of 10 000 000.
        @param _interestRatePunitory The punitory interest rate by second, defined as a denominator of 10 000 000.
            Ej: interestRate 11108571428571 = 28% Anual interest
        @param _duesIn The time in seconds that the borrower has in order to pay the debt after the lender lends the money.
        @param _cancelableAt Delta in seconds specifying how much interest should be added in advance, if the borrower pays 
        entirely or partially the loan before this term, no extra interest will be deducted.
        @param _expirationRequest Timestamp of when the loan request expires, if the loan is not filled before this date, 
            the request is no longer valid.
        @param _metadata String with loan metadata.
    */
    function createLoan(Oracle _oracleContract, address _borrower, bytes32 _currency, uint256 _amount, uint256 _interestRate,
        uint256 _interestRatePunitory, uint256 _duesIn, uint256 _cancelableAt, uint256 _expirationRequest, string _metadata) public returns (uint256) {
        require(!deprecated);
        require(_cancelableAt <= _duesIn);
        require(_oracleContract != address(0) || _currency == 0x0);
        require(_borrower != address(0));
        require(_amount != 0);
        require(_interestRatePunitory != 0);
        require(_interestRate != 0);
        require(_expirationRequest > block.timestamp);
        var loan = Loan(Status.initial, _oracleContract, _borrower, 0x0, msg.sender, 0x0, _amount, 0, 0, 0, 0, _interestRate,
            _interestRatePunitory, 0, _duesIn, _currency, _cancelableAt, 0, 0x0, _expirationRequest, _metadata);
        uint index = loans.push(loan) - 1;
        CreatedLoan(index, _borrower, msg.sender);
        bytes32 identifier = getIdentifier(index);
        require(identifierToIndex[identifier] == 0);
        identifierToIndex[identifier] = index;
        if (msg.sender == _borrower) {
            approveLoan(index);
        }
        return index;
    }
}