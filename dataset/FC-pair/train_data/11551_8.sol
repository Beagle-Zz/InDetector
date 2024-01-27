contract c11551{
    /**
        @dev given two connector balances/weights and a sell amount (in the first connector token),
        calculates the return for a conversion from the first connector token to the second connector token (in the second connector token)
        Formula:
        Return = _toConnectorBalance * (1 - (_fromConnectorBalance / (_fromConnectorBalance + _amount)) ^ (_fromConnectorWeight / _toConnectorWeight))
        @param _fromConnectorBalance    input connector balance
        @param _fromConnectorWeight     input connector weight, represented in ppm, 1-1000000
        @param _toConnectorBalance      output connector balance
        @param _toConnectorWeight       output connector weight, represented in ppm, 1-1000000
        @param _amount                  input connector amount
        @return second connector amount
    */
    function calculateCrossConnectorReturn(uint256 _fromConnectorBalance, uint32 _fromConnectorWeight, uint256 _toConnectorBalance, uint32 _toConnectorWeight, uint256 _amount) public view returns (uint256) {
        // validate input
        require(_fromConnectorBalance > 0 && _fromConnectorWeight > 0 && _fromConnectorWeight <= MAX_WEIGHT && _toConnectorBalance > 0 && _toConnectorWeight > 0 && _toConnectorWeight <= MAX_WEIGHT);
        // special case for equal weights
        if (_fromConnectorWeight == _toConnectorWeight)
            return safeMul(_toConnectorBalance, _amount) / safeAdd(_fromConnectorBalance, _amount);
        uint256 result;
        uint8 precision;
        uint256 baseN = safeAdd(_fromConnectorBalance, _amount);
        (result, precision) = power(baseN, _fromConnectorBalance, _fromConnectorWeight, _toConnectorWeight);
        uint256 temp1 = safeMul(_toConnectorBalance, result);
        uint256 temp2 = _toConnectorBalance << precision;
        return (temp1 - temp2) / result;
    }
}