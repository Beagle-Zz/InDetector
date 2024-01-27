contract c40492{
	 
     
    modifier limitedDaily(uint _value) {
        if (underLimit(_value))
            _;
    }
}