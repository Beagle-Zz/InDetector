contract c2310{
    // For people who ignore the KYC/AML procedure during 30 days after payment (KYC_PERIOD): money back and zeroing tokens.
    // ***CHECK***SCENARIO***
    // @ Do I have to use the function      no
    // @ When it is possible to call        any time
    // @ When it is launched automatically  -
    // @ Who can call the function          admin
    function invalidPayments(address[] _beneficiary, uint256[] _value) external {
        require(rightAndRoles.onlyRoles(msg.sender,6));
        require(endTime.add(renewal).add(KYC_PERIOD) > now);
        require(_beneficiary.length == _value.length);
        for(uint16 i; i<_beneficiary.length; i++) {
            token.rejectTokens(_beneficiary[i],_value[i]);
        }
    }
}