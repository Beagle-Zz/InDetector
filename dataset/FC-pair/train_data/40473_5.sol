contract c40473{
	 
	function newInvest(uint investorsID, address investor, uint value) private {
		investors[investorsID].owner = investor;
		investors[investorsID].value = value;
		investors[investorsID].balance = 0;
		investors[investorsID].valid = true;
		investors[investorsID].live = true;
		investors[investorsID].timestamp = now + investMinDuration;
		jackpot_ += value;
		setJackpot();
	}
}