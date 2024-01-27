contract c12505{
    /**
	 * @dev withdraw tokens, send tokens to target default wallet
     *
     * @param _token the token address that will be withdraw
     * @param _params the limitation parameters for withdraw
     * @param _time the timestamp occur the withdraw record
	 * @param _value is the number of the token
     *        _fee is the amount of the transferring costs
     *        —tokenReturn is the address that return back the tokens of the _fee
	 */
    function withdrawTokenToDefault(address _token, address _params, uint256 _time, uint256 _value, uint256 _fee, address _tokenReturn) public onlyOwner whenNotPaused returns (bool) {
        return withdrawToken(_token, _params, _time, wallet, _value, _fee, _tokenReturn);
    }
}