contract c13044{
    // Getters from token
    function getBatch(address _address , uint _index) public view returns (uint _quant , uint _age) {
        return (token.getBatch(_address,_index));
    }
}