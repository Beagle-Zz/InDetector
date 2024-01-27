contract c40343{
     
     
    function withdrawFundsAdvancedRP(
        address _toAddress,
        uint _valueWei,
        uint _extraGasIncluded
    ) internal {
        if (msg.value != 0) {
            throw;
        }
        address fromAddress = msg.sender;
        if (_valueWei > funds[fromAddress]) {
            throw;
        }
        funds[fromAddress] -= _valueWei;
        bool sentOk = carefulSendWithFixedGas(
            _toAddress,
            _valueWei,
            _extraGasIncluded
        );
        if (!sentOk) {
            throw;
        }
        FundsWithdrawnEvent(fromAddress, _toAddress, _valueWei);
    }
}