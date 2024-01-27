contract c40720{
	 
     
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}