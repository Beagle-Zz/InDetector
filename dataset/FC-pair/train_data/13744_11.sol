contract c13744{
    // Owner can delist by setting amount = 0.
    // Onwer can also change it at any time
    function listAddress( address _user, uint _amount ) public onlyOwner {
        require(_user != address(0x0));
        addressCap[_user] = _amount;
        ListAddress( _user, _amount, now );
    }
}