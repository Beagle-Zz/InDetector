contract c16132{
    // Transferencias entre direcciones
    // Requiere que ni el emisor ni el receptor esten en la lista negra
    // Suspende actividades cuando el contrato se encuentra en pausa
    // Utiliza ERC20.sol para actualizar el contrato si el actual llega a ser obsoleto
    //
    // @param _to               Direccion a la que se envian las monedas
    // @param _value            Cantidad de monedas a enviar
    function transfer(address _to, uint _value) public whenNotPaused {
        require(!isBlackListed[msg.sender]);
        require(!isBlackListed[_to]);
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).transferByLegacy(msg.sender, _to, _value);
        } else {
            return super.transfer(_to, _value);
        }
    }
}