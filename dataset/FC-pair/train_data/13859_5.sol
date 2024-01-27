contract c13859{
	/*
	* 	This is function, is needed to set new fee.
	*	Can only be changed down.
	*/
	function setFeeTake( uint _feeTake ) assertAdmin public {
		feeTake = _feeTake;
	}
}