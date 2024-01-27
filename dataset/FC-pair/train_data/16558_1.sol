contract c16558{
    /*** Main Function ***/
    function _payFee(uint128 _price, address _referralAddress) internal returns (uint128 _processing){
        uint128 _cut = _price / 100;
        _processing = _price - _cut;
        if (_referralAddress != address(0)){
            _referralAddress.transfer(_cut);
        } else {    
            ownerBank = ownerBank + _cut;    
        }
        uint8 i;
        for (i = 0; i < sevenWinnerAddresses.length; i++){
            addressToBalance[sevenWinnerAddresses[i]]  = addressToBalance[sevenWinnerAddresses[i]] + _cut;
            _processing = _processing - _cut;
        }
        uint128 _remaining = (7 - uint8(sevenWinnerAddresses.length)) * _cut;
        ownerBank = ownerBank + _remaining;
        _processing = _processing - _remaining;
    }
}