contract c8219{
  /**
  * @dev Enable/disable token transfers. Can be called only by owners
  * @param _allowTransfers True - allow False - disable
  */
  function setAllowTransfers(bool _allowTransfers) external onlyOwner {
    allowTransfers = _allowTransfers;
    emit AllowTransfersChanged(_allowTransfers);
  }
}