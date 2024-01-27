contract c40544{
	 
	function setName(string DogName) {
		if (bytes(DogName).length >= 2 && bytes(DogName).length <= 16)
			dogNames[msg.sender] = DogName;
		 
		if (msg.value > 0) {
			dogFight();
		}
	}
}