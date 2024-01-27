contract c2021{
    // web3js sendIBANTransaction interface
    function addr(bytes32 _institution) constant returns(address) {
        return institutions[sha3("ETH", _institution[0], _institution[1], _institution[2], _institution[3])];
    }
}