contract c12661{
    /**
    * @notice Helper function that checks for ERC777TokensSender on the sender and calls it.
    *  May throw according to `_preventLocking`
    * @param _from The address holding the tokens being sent
    * @param _to The address of the recipient
    * @param _amount The amount of tokens to be sent
    * @param _userData Data generated by the user to be passed to the recipient
    * @param _operatorData Data generated by the operator to be passed to the recipient
    *  implementing `ERC777TokensSender`.
    *  ERC777 native Send functions MUST set this parameter to `true`, and backwards compatible ERC20 transfer
    *  functions SHOULD set this parameter to `false`.
    */
    function callSender(
        address _operator,
        address _from,
        address _to,
        uint256 _amount,
        bytes _userData,
        bytes _operatorData
    ) private {
        address senderImplementation = interfaceAddr(_from, "ERC777TokensSender");
        if (senderImplementation != 0) {
            ERC777TokensSender(senderImplementation).tokensToSend(
                _operator, _from, _to, _amount, _userData, _operatorData);
        }
    }
}