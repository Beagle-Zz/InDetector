contract c10770{
    /*
        panicButton and refundUser are here incase of an emergency, or launch of a new contract
        The game will be frozen, and all token holders will be refunded
    */
    function panicButton(bool newStatus)
        public
        onlyAdmin
    {
        gamePaused = newStatus;
    }
}