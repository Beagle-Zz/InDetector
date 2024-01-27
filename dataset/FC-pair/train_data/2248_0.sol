contract c2248{
  /**
   * @dev Create a crop contract that can hold P3D and auto-reinvest.
   * @param _referrer referral address for buying P3D.
   */
  function create(address _referrer) external payable {
    // sender must not own a crop
    require(crops[msg.sender] == address(0));
    // create a new crop
    crops[msg.sender] = (new ProxyCrop).value(msg.value)(msg.sender, _referrer);
    // fire event
    emit CreateCrop(msg.sender, crops[msg.sender]);
  }
}