contract c40223{
     
    modifier isRegistrar() {
        Registrar registrar = Registrar(registrarAddress);
        if (registrar.registrar() == msg.sender) {
            _;
        }
    }
}