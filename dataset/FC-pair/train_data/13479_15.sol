contract c13479{
  /**
   * @notice Internal function for changing the token address
   * @param _tokenAddress Address where the new ERC20 contract is deployed
   */
  function _changeTokenAddress(address _tokenAddress) internal {
    require(_tokenAddress != address(0));
    address oldAddress = fidaTokenAddress;
    fidaTokenAddress = _tokenAddress;
    fidaToken = ERC20Basic(_tokenAddress);
    mintableFida = MintableTokenInterface(_tokenAddress);
    emit TokenAddressChanged(oldAddress, _tokenAddress);
  }
}