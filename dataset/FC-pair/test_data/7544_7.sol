contract c7544{
	/** 
      * @dev called by the owner to pause, triggers stopped state 
      */ 
	function pause() onlyOwner whenNotPaused public { 
		paused = true; 
		Pause(); 
	} 
}