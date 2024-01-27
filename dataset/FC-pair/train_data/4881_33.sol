contract c4881{
	/// @notice Fallback function for ERC223 standard.
	/// Allowed to work only in active state.
	/// @param _sender original sender of token transfer
	/// @param _value amount of tokens that has been sent
	function tokenFallback(address _sender, uint _value, bytes) external {
		/// Don't allow to transfer and exchange tokens when Buyback contract
		/// is not in 'active' state
		if (!active) {
			revert();
		}
		/// This call should be produced by AssetProxy's backend - an Asset contract.
		/// Any other call will be followed by revert()
		ATxAssetProxy _token = token;
		if (msg.sender != _token.getLatestVersion()) {
			revert();
		}
		/// Need to check available ETH balance in order to fulfill holder's request
		/// about exchanging ATx Token to ETH equivalent
		uint _etherToExchange = _value.mul(price) / (10 ** uint(_token.decimals()));
		if (this.balance < _etherToExchange) {
			revert();
		}
		/// To prevent double spending we revoke transferred assets from foundation platform,
		ATxPlatformInterface _platform = ATxPlatformInterface(address(_token.platform()));
		require(OK == _platform.revokeAsset(_token.smbl(), _value));
		/// Take redemption fee and return left amount of Ether to transfer it to a holder
		uint _restEther = _takeRdFee(_etherToExchange);
		/// Transfer the rest to holder's account
		_sender.transfer(_restEther);
		/// Voila! Just emit the event to say to the world that one more exchange action was finished
		TokenExchanged(_sender, _token, _value, _restEther, _etherToExchange.sub(_restEther), rdCollectorAddress, price);
	}
}