contract c40224{
     
    function setNextRegistrar(address _registrar) isRegistrar noEther returns (bool) {
        registrar = _registrar;
        return true;
    }
}