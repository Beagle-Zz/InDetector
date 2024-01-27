contract c18865{
	/* buyout mode is set to flag "status" value, true/false */
    function setByuoutActive(bool status) public onlyOwner {
        byuoutActive = status;
    }
}