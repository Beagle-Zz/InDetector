contract c40464{
     
    modifier checkWaitingForSpin(){
        if (playerStatus[msg.sender]!=Status.waitingForSpin) throw;
	_;
	}
}