contract c11223{
  /**
  * @dev return the number of the current window
  * @return the window, range: [0-totalWindows)
  */
  function currentWindow() view public returns (uint256) {
    return windowOf(block.timestamp); // solium-disable-line
  }
}