contract c3880{
    /**
     * owner send tokens to admin.
     */
    function transferToAdmin(uint256 _value) public onlyOwner onlyWhenTransferEnabled returns (bool) {
    	return super.transfer(adminAddr, _value);
    }
}