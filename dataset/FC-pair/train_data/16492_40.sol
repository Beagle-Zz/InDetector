contract c16492{
    /**
    * @dev buy gen0 chibis
    * @param _name name of the Chibi
    */
    function buyGEN0Chibi(string _name, string _battleRoar, uint8 _region, uint _seed) payable public returns (bool success) {
        require(paused == false);
        // cost at least 100 wei
        require(msg.value == priceChibi);
        // name can be empty
        _mint(_name, _battleRoar, _region, _seed, false, 0);
        return true;
    }
}