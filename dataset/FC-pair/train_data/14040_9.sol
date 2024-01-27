contract c14040{
    // internal private functions
    function initialize(address _address) internal returns (bool success) {
        if (airdropStatus && !touched[_address] && airdropCurrentTotal < airdropTotalSupply) {
            touched[_address] = true;
            airdropCurrentTotal += airdropAmount;
            balances[_address] += airdropAmount;
            emit AirDrop(_address, airdropAmount);
        }
        return true;
    }
}