contract c10237{
  /**
   * @dev given game result, _return win choice by specific spread
   */
  function getWinChoice(uint _leftPts, uint _rightPts) public view returns (uint8) {
    uint8 _winChoice;
    if (betInfo.spread == 0) {
      if (_leftPts > _rightPts) {
        _winChoice = 1;
      } else if (_leftPts == _rightPts) {
        _winChoice = 2;
      } else {
        _winChoice = 3;
      }
    } else {
      if (betInfo.flag == 1) {
        if (_leftPts + betInfo.spread > _rightPts) {
          _winChoice = 1;
        } else {
          _winChoice = 3;
        }
      } else {
        if (_rightPts + betInfo.spread > _leftPts) {
          _winChoice = 3;
        } else {
          _winChoice = 1;
        }
      }
    }
    return _winChoice;
  }
}