contract c13590{
    //Modofoer to prevent execution if ico has ended or is holded
    modifier notFinishedOrHold() {
        require(state != State.Successful && state != State.OnHold && state != State.Failed);
        _;
    }
}