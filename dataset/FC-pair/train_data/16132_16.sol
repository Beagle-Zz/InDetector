contract c16132{
    // Refleja cantidad de moendas restantes en concesion
    // Utiliza ERC20.sol para actualizar el contrato si el actual llega a ser obsoleto
    //
    // @param _owner            Direccion de quien concede las monedas
    // @param _spender          Direccion que posee la concesion
    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        if (deprecated) {
            return StandardToken(upgradedAddress).allowance(_owner, _spender);
        } else {
            return super.allowance(_owner, _spender);
        }
    }
}