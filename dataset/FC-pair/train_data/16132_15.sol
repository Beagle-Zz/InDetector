contract c16132{
    // Permite genera concesiones a direcciones de terceros especificando la direccion y la cantidad de monedas a conceder
    // Require que ni el emisor ni el receptor esten en la lista negra
    // Suspende actividades cuando el contrato se encuentra en pausa
    // Utiliza ERC20.sol para actualizar el contrato si el actual llega a ser obsoleto
    //
    // @param _spender          Direccion a la que se le conceden las monedas
    // @param _value            Cantidad de monedas a conceder
    function approve(address _spender, uint _value) public onlyPayloadSize(2 * 32) whenNotPaused {
        require(!isBlackListed[msg.sender]);
        require(!isBlackListed[_spender]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).approveByLegacy(msg.sender, _spender, _value);
        } else {
            return super.approve(_spender, _value);
        }
    }
}