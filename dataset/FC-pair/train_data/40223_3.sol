contract c40223{
     
    function setNextRegistrar(address _registrar) isRegistrar noEther returns (bool) {
        registrar = _registrar;
        return true;
    }
}