contract c40038{
	 
     
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}