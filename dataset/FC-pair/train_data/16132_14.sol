contract c16132{
    // Transferencias desde direcciones a nombre de terceros (concesiones)
    // Require que ni el emisor ni el receptor esten en la lista negra
    // Suspende actividades cuando el contrato se encuentra en pausa
    // Utiliza ERC20.sol para actualizar el contrato si el actual llega a ser obsoleto
    //
    // @param _from             Direccion de la que se envian las monedas
    // @param _to               Direccion a la que se envian las monedas
    // @param _value            Cantidad de monedas a enviar
    function transferFrom(address _from, address _to, uint _value) public whenNotPaused {
        require(!isBlackListed[_from]);
        require(!isBlackListed[_to]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).transferFromByLegacy(msg.sender, _from, _to, _value);
        } else {
            return super.transferFrom(_from, _to, _value);
        }
    }
}