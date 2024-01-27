contract c11863{
    /**
	 * @dev withdraw tokens, send tokens to target default wallet
     *
     * @param _token the token address that will be withdraw
     * @param _walletParams the wallet management parameters
	 */
    function bindToken(address _token, address _walletParams) onlyOwner public returns (bool) {
        require(_token != address(0));
        require(_walletParams != address(0));
        tk = ERC20(_token);
        params = DRCWalletMgrParams(_walletParams);
        return true;
    }
}