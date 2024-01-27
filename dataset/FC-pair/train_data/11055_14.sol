contract c11055{
  // Dev cut
  function calculateDevCut (uint256 _price) public view returns (uint256 _devCut) {
    if (_price < increaseLimit1) {
      return _price.mul(5).div(100); // 5%
    } else if (_price < increaseLimit2) {
      return _price.mul(4).div(100); // 4%
    } else if (_price < increaseLimit3) {
      return _price.mul(3).div(100); // 3%
    } else if (_price < increaseLimit4) {
      return _price.mul(3).div(100); // 3%
    } else {
      return _price.mul(2).div(100); // 2%
    }
  }
}