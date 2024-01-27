contract c2291{
    /**
     * @notice validate transfer with TransferManager module if it exists
     * @dev TransferManager module has a key of 2
     * @param _from sender of transfer
     * @param _to receiver of transfer
     * @param _amount value of transfer
     * @return bool
     */
    function verifyTransfer(address _from, address _to, uint256 _amount) public checkGranularity(_amount) returns (bool) {
        if (!freeze) {
            bool isTransfer = false;
            if (transferFunctions[getSig(msg.data)]) {
              isTransfer = true;
            }
            if (modules[TRANSFERMANAGER_KEY].length == 0) {
                return true;
            }
            bool isInvalid = false;
            bool isValid = false;
            bool isForceValid = false;
            for (uint8 i = 0; i < modules[TRANSFERMANAGER_KEY].length; i++) {
                ITransferManager.Result valid = ITransferManager(modules[TRANSFERMANAGER_KEY][i].moduleAddress).verifyTransfer(_from, _to, _amount, isTransfer);
                if (valid == ITransferManager.Result.INVALID) {
                    isInvalid = true;
                }
                if (valid == ITransferManager.Result.VALID) {
                    isValid = true;
                }
                if (valid == ITransferManager.Result.FORCE_VALID) {
                    isForceValid = true;
                }
            }
            return isForceValid ? true : (isInvalid ? false : isValid);
      }
      return false;
    }
}