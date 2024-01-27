contract c10769{
    /**
	 * @dev withdraw tokens, send tokens to target
     *
     * @param _token the token address that will be withdraw
	 * @param _to is where the tokens will be sent to
	 *        _value is the number of the token
	 */
    function withdrawToken(address _token, address _to, uint256 _value) public onlyOwner returns (bool) {
        require(_to != address(0));
        require(_token != address(0));
        ERC20 tk = ERC20(_token);
        tk.transfer(_to, _value);
        emit WithdrawToken(_token, _to, _value);
        return true;
    }
}