contract c2977{
  /**
   * Enable or block transfers - to be called in case of emergency
   * @param _value {bool}
  */
  function enableMasterTransfers(bool _value) public onlyController {
    masterTransfersEnabled = _value;
  }
}