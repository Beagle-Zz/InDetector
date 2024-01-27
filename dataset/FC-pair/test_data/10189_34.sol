contract c10189{
    /**
    * @dev Change the transfer fee percentage to be paid in Custom tokens.
    * @param _transferFeePercentage The fee percentage to be paid for transfer in range [0, 100].
    */
    function setTransferFeePercentage(uint256 _transferFeePercentage) public onlyOwner {
        require(0 <= _transferFeePercentage && _transferFeePercentage <= 100, "_transferFeePercentage not in [0, 100]");
        require(_transferFeePercentage != transferFeePercentage, "_transferFeePercentage equal to current value");
        transferFeePercentage = _transferFeePercentage;
        emit LogTransferFeePercentageChanged(msg.sender, _transferFeePercentage);
    }
}