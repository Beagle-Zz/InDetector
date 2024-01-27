contract c16132{
    // Refleja el balance de una direccion
    // Utiliza ERC20.sol para actualizar el contrato si el actual llega a ser obsoleto
    //
    // @param who               Direccion a consultar
    function balanceOf(address who) public constant returns (uint) {
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).balanceOf(who);
        } else {
            return super.balanceOf(who);
        }
    }
}