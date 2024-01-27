contract c13858{
  /**
   * @dev called by investors to purchase tokens
   * @param _r part of receipt signature
   * @param _s part of receipt signature
   * @param _payload payload of signed receipt.
   *   The receipt commits to the follwing inputs:
   *     160 bits - beneficiary address - address whitelisted to receive tokens
   *     32 bits - time - when receipt was signed
   *     56 bits - sale contract address, to prevent replay of receipt
   *     8 bits - v-part of receipt signature
   */
  function purchase(bytes32 _r, bytes32 _s, bytes32 _payload) public payable {
    // parse inputs
    uint32 time = uint32(_payload >> 160);
    address beneficiary = address(_payload);
    // verify inputs
    require(uint56(_payload >> 192) == uint56(this));
    /* solium-disable-next-line arg-overflow */
    require(ecrecover(keccak256(uint8(0), uint56(_payload >> 192), time, beneficiary), uint8(_payload >> 248), _r, _s) == signer);
    require(beneficiary != address(0));
    // calculate token amount to be created
    uint256 rate = getRateAt(now); // solium-disable-line security/no-block-members
    // at the time of signing the receipt the rate should have been the same as now
    require(rate == getRateAt(time));
    // multiply rate with Gwei of investment
    uint256 tokens = rate.mul(msg.value).div(1000000000);
    // check that msg.value > 0
    require(tokens > 0);
    // pocket Ether
    wallet.transfer(msg.value);
    // do token transfer
    ERC20(token).transferFrom(wallet, beneficiary, tokens);
    emit TokenPurchase(beneficiary, msg.value, tokens);
  }
}