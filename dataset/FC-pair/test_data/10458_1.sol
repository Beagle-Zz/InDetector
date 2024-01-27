contract c10458{
    // Standard function transfer similar to ERC20 transfer with no _data .
    // Added due to backwards compatibility reasons .
    function transfer(address _to, uint256 _value)public returns (bool success) {
     require(!frozenAccount[msg.sender] && !frozenAccount[_to]);
     bytes memory empty;
     if(isContract(_to)) {
        return transferToContract(_to, _value, empty);
     }
     else {
        return transferToAddress(_to, _value, empty);
     }
   }
}