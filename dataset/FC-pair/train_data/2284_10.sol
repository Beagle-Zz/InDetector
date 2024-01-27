contract c2284{
    /**
    *@dev Refund money if KYC/AML fails
    *@param _to address to send refund
    *@param _amount to refund. If no amount  is specified the current memberFee is refunded
    */
    function refund(address _to, uint _amount) public onlyOwner {
        require (_to != address(0));
        if (_amount == 0) {_amount = memberFee;}
        Member storage currentAddress = members[_to];
        membersAccts[currentAddress.memberId-1] = 0;
        currentAddress.memberId = 0;
        currentAddress.membershipType = 0;
        _to.transfer(_amount);
        emit Refund(_to, _amount);
    }
}