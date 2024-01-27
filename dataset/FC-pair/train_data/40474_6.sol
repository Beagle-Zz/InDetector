contract c40474{
	 
	function collectFee() {
		msg.sender.send(msg.value);
		if (msg.sender == creator) {
			creator.send(feeCollected);
			feeCollected = 0;
		} else {
			return;
		}
	}
}