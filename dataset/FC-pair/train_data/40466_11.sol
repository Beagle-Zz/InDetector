contract c40466{
     
    modifier checkWaitingForSpin(){
        if (playerStatus[msg.sender]!=Status.waitingForSpin) throw;
	_;
	}
}