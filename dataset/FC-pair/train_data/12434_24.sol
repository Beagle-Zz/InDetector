contract c12434{
  /**
   * @notice Create a new mission
   * @param _sellerId The DAV Identity of the person providing the service
   * @param _buyerId The DAV Identity of the person ordering the service
   * @param _cost The total cost of the mission to be paid by buyer
   */
  function create(bytes32 _missionId, address _sellerId, address _buyerId, uint256 _cost) public {
    // Verify that message sender controls the buyer's wallet
    require(
      identity.verifyOwnership(_buyerId, msg.sender)
    );
    // Verify buyer's balance is sufficient
    require(
      identity.getBalance(_buyerId) >= _cost
    );
    // Make sure id isn't registered already
    require(
      missions[_missionId].buyer == 0x0
    );
    // Transfer tokens to the mission contract
    token.transferFrom(msg.sender, this, _cost);
    // Create mission
    missions[_missionId] = Mission({
      seller: _sellerId,
      buyer: _buyerId,
      cost: _cost,
      balance: _cost,
      isSigned: false
    });
    // Event
    emit Create(_missionId, _sellerId, _buyerId);
  }
}