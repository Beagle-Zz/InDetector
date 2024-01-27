contract c18775{
    // import preICO customers from 0x516130856e743090af9d7fd95d6fc94c8743a4e1
    function importCustomer(address _customer, address _referral, uint _tokenAmount) public {
        require(msg.sender == registerbot || msg.sender == owner);
        require(_customer != address(0));
        require(now < startSale); // before ICO starts
        registered[_customer] = true;
        if (_referral != address(0) && _referral != _customer) {
            referral[_customer] = _referral;
        }
        mint(_customer, _tokenAmount, now + 99 * 1 years); // till KYC is completed
    }
}