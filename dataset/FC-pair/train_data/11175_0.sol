contract c11175{
	/*******************/
	/* Owner Function **/
	/*******************/
    /* @dev Update Contract Configuration  */
    function ownerUpdateToken(ERC20 _token, address _wallet) public onlyOwner{
        token = _token;
        wallet = _wallet;
        emit eWalletChange(wallet, msg.sender);
    }
}