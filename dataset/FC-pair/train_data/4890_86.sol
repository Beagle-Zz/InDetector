contract c4890{
    //TODO need additional check: not clear check of country limit:
    function _isValidDepositCountry(uint _balance, uint _currentHolderCount, uint _maxHolderNumber) private pure returns (bool) {
        return !(_balance == 0 && _currentHolderCount == _maxHolderNumber);
    }
}