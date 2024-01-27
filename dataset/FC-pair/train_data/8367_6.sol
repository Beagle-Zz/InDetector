contract c8367{
  /// @dev purchase DGX gold using ETH
  /// @param _block_number Block number from DTPO (Digix Trusted Price Oracle)
  /// @param _nonce Nonce from DTPO
  /// @param _wei_per_dgx_mg Price in wei for one milligram of DGX
  /// @param _signer Address of the DTPO signer
  /// @param _signature Signature of the payload
  /// @return {
  ///   "_success": "returns true if operation is successful",
  ///   "_purchased_amount": "DGX nanograms received"
  /// }
  function purchaseWithEth(uint256 _block_number, uint256 _nonce, uint256 _wei_per_dgx_mg, address _signer, bytes _signature)
           payable
           public
           returns (bool _success, uint256 _purchased_amount)
  {
    address _sender = msg.sender;
    (_success, _purchased_amount) =
      marketplace_controller_v2().purchase_with_eth.value(msg.value).gas(600000)(msg.value, _sender, _block_number,
                                                                             _nonce, _wei_per_dgx_mg, _signer, _signature);
    require(_success);
  }
}